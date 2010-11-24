// Copyright (c) 1996 James Clark
// See the file copying.txt for copying permission.

#include "stylelib.h"
#include "DssslSpecEventHandler.h"
#include "InterpreterMessages.h"
#include "InternalInputSource.h"
#include "FOTBuilder.h"
#include "macros.h"
#include "Node.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

// FIXME Stop parsing spec when we know we don't we have everything we ever need

class TextInputSourceOrigin : public InputSourceOrigin {
public:
  TextInputSourceOrigin(Text &text);
  Boolean defLocation(Offset off, const Origin *&, Index &) const;
  const Text &text() const { return text_; }
  void noteCharRef(Index, const NamedCharRef &);
  void setExternalInfo(ExternalInfo *);
  InputSourceOrigin *copy() const;
  const Location &parent() const;
private:
  Text text_;
  Location refLocation_;
};

DssslSpecEventHandler::DssslSpecEventHandler(Messenger &mgr)
: mgr_(&mgr), gatheringBody_(0), currentPart_(0), currentDoc_(0), 
currentDecl_(0)
{
}

void DssslSpecEventHandler::load(SgmlParser &specParser,
				 const CharsetInfo &charset,
				 const StringC &id,
				 Vector<Part *> &parts)
{
  parser_ = &specParser;
  charset_ = &charset;
  Doc *doc = findDoc(StringC());
  // Load it now so that we can get the concrete syntax.
  doc->load(*this);
  Part *tem;
  if (id.size() == 0)
    tem = doc->resolveFirstPart(*this);
  else {
    StringC normId(id);
    ConstPtr<Syntax> syn = parser_->instanceSyntax();
    if (!syn.isNull())
      syn->generalSubstTable()->subst(normId);
    tem = doc->refPart(normId)->resolve(*this);
  }
  resolveParts(tem, parts);
}

DssslSpecEventHandler::Doc *DssslSpecEventHandler::findDoc(const StringC &sysid)
{
  for (IListIter<Doc> iter(docs_); !iter.done(); iter.next())
    if (sysid == iter.cur()->sysid())
      return iter.cur();
  Doc *doc = new Doc(sysid);
  docs_.insert(doc);
  return doc;
}

void DssslSpecEventHandler::resolveParts(Part *part, Vector<Part *> &parts)
{
  if (!part)
    return;
  parts.push_back(part);
  if (part->setMark()) {
    mgr_->message(InterpreterMessages::useLoop);
    return;
  }
  const Vector<PartHeader *> &use = part->use();
  for (size_t i = 0; i < use.size(); i++) {
    Part *tem = use[i]->resolve(*this);
    resolveParts(tem, parts);
  }
  part->setMark(0);
}

void DssslSpecEventHandler::loadDoc(SgmlParser &parser, Doc &doc)
{
  currentDoc_ = &doc;
  gotArc_ = 0;
  ArcEngine::parseAll(parser, *mgr_, *this, cancelPtr());
  if (!gotArc_) {
    mgr_->message(InterpreterMessages::specNotArc);
    return;
  }
}


EventHandler *
DssslSpecEventHandler::arcEventHandler(const StringC *arcPublicId,
                                       const Notation *notation,
				       const Vector<StringC> &,
				       const SubstTable *)
{
  if (!notation)
    return 0;
  const StringC *pubid = notation->externalId().publicIdString();
  static const char dssslArc[]
    = "ISO/IEC 10179:1996//NOTATION DSSSL Architecture Definition Document//EN";
  if (pubid == 0 || pubid->size() != sizeof(dssslArc) - 1)
    return 0;
  for (int i = 0; dssslArc[i] != '\0'; i++) {
    if (dssslArc[i] != (*pubid)[i])
      return 0;
  }
  gotArc_ = 1;
  return this;
}

void DssslSpecEventHandler::message(MessageEvent *event)
{
  mgr_->dispatchMessage(event->message());
  delete event;
}

static struct {
  const char *gi;
  void (DssslSpecEventHandler::*start)(const StartElementEvent &);
  void (DssslSpecEventHandler::*end)(const EndElementEvent &);
} mappingTable[] = {
  { "STYLE-SPECIFICATION",
    &DssslSpecEventHandler::styleSpecificationStart,
    &DssslSpecEventHandler::styleSpecificationEnd },
  { "STYLE-SPECIFICATION-BODY",
    &DssslSpecEventHandler::styleSpecificationBodyStart,
    &DssslSpecEventHandler::styleSpecificationBodyEnd },
  { "EXTERNAL-SPECIFICATION",
    &DssslSpecEventHandler::externalSpecificationStart,
    &DssslSpecEventHandler::externalSpecificationEnd },
  { "FEATURES", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "BASESET-ENCODING", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "LITERAL-DESCRIBED-CHAR", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "ADD-NAME-CHARS",
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "ADD-SEPARATOR-CHARS",
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "STANDARD-CHARS", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "OTHER-CHARS", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "COMBINE-CHAR", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "MAP-SDATA-ENTITY", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "CHAR-REPERTOIRE", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
  { "SGML-GROVE-PLAN", 
    &DssslSpecEventHandler::declarationStart,
    &DssslSpecEventHandler::declarationEnd },
};

void DssslSpecEventHandler::endProlog(EndPrologEvent *event)
{
  currentDoc_->setLocation(event->location());
  delete event;
}

void DssslSpecEventHandler::startElement(StartElementEvent *event)
{
  for (size_t i = 0; i < SIZEOF(mappingTable); i++)
    if (event->name() == mappingTable[i].gi) {
      (this->*(mappingTable[i].start))(*event);
      break;
    }
  delete event;
}

void DssslSpecEventHandler::endElement(EndElementEvent *event)
{
  for (size_t i = 0; i < SIZEOF(mappingTable); i++)
    if (event->name() == mappingTable[i].gi) {
      (this->*(mappingTable[i].end))(*event);
      break;
    }
  delete event;
}

void DssslSpecEventHandler::data(DataEvent *event)
{
  if (gatheringBody_)
    currentBody_.addChars(event->data(), event->dataLength(), event->location());
  delete event;
}

const Text *
DssslSpecEventHandler::attributeText(const StartElementEvent &event,
				     const char *attName)
{
  const AttributeList &atts = event.attributes();
  StringC attNameString;
  for (const char *p = attName; *p; p++)
    attNameString += Char(*p);
  unsigned index;
  if (atts.attributeIndex(attNameString, index)) {
    const AttributeValue *val = atts.value(index);
    if (val)
      return val->text();
  }
  return 0;
}

const StringC *
DssslSpecEventHandler::attributeString(const StartElementEvent &event,
				       const char *attName)
{
  const Text *text = attributeText(event, attName);
  if (text)
    return &text->string();
  else
    return 0;
}

ConstPtr<Entity>
DssslSpecEventHandler::attributeEntity(const StartElementEvent &event,
				       const char *attName)
{
  const AttributeList &atts = event.attributes();
  StringC attNameString;
  for (const char *p = attName; *p; p++)
    attNameString += Char(*p);
  unsigned index;
  if (!atts.attributeIndex(attNameString, index))
    return 0;
  const AttributeSemantics *sem = atts.semantics(index);
  if (!sem || sem->nEntities() != 1)
    return 0;
  return sem->entity(0);
}

void DssslSpecEventHandler::externalSpecificationStart(const StartElementEvent &event)
{
  StringC empty;
  const StringC *idP = attributeString(event, "ID");
  if (!idP)
    idP = &empty;
  PartHeader *header = currentDoc_->refPart(*idP);
  const Entity *ent = attributeEntity(event, "DOCUMENT").pointer();
  if (!ent)
    return;
  const ExternalEntity *ext = ent->asExternalEntity();
  if (!ext)
    return;
  const StringC &sysid = ext->externalId().effectiveSystemId();
  if (sysid.size()) {
    Doc *doc = findDoc(sysid);
    const StringC *specidP = attributeString(event, "SPECID");
    if (!specidP)
      header->setPart(new ExternalFirstPart(doc));
    else
      header->setPart(new ExternalPart(doc->refPart(*specidP, event.location())));
  }
}

void DssslSpecEventHandler::externalSpecificationEnd(const EndElementEvent &)
{
  // nothing to do
}

void DssslSpecEventHandler::styleSpecificationStart(const StartElementEvent &event)
{
  StringC empty;
  const StringC *idP = attributeString(event, "ID");
  if (!idP)
    idP = &empty;
  PartHeader *header = currentDoc_->refPart(*idP);
  // FIXME give an error (or ignore) if header has part already
  const Text *useP = attributeText(event, "USE");
  header->setPart(currentPart_ = new Part(currentDoc_));
  if (useP) {
    const StringC &use = useP->string();
    size_t i = 0;
    for (;;) {
      size_t j;
      for (j = i; j < use.size() && use[j] != ' '; j++)
	;
      if (j > i)
	currentPart_->addUse(currentDoc_->refPart(StringC(use.data() + i,
							  j - i),
						  useP->charLocation(i)));
      if (j >= use.size())
	break;
      i = j + 1;
    }
  }
  // FIXME Give warning if selected part is incomplete
}

void DssslSpecEventHandler::styleSpecificationEnd(const EndElementEvent &event)
{
  currentPart_ = 0;
}

void DssslSpecEventHandler::styleSpecificationBodyStart(const StartElementEvent &event)
{
  if (currentPart_) {
    currentBody_.clear();
    ConstPtr<Entity> entity = attributeEntity(event, "CONTENT");
    if (entity.isNull())
      gatheringBody_ = 1;
    else
      currentPart_->append(new EntityBodyElement(entity));
  }
}

void DssslSpecEventHandler::styleSpecificationBodyEnd(const EndElementEvent &event)
{
  if (gatheringBody_) {
    if (currentPart_)
      currentPart_->append(new ImmediateBodyElement(currentBody_));
    gatheringBody_ = 0;
  }
}

void DssslSpecEventHandler::declarationStart(const StartElementEvent &event)
{
   if (currentPart_ || currentDoc_) {
     currentBody_.clear();
     gatheringBody_ = 1;
     DssslSpecEventHandler::DeclarationElement::Type type;
     if (event.name() == "FEATURES")
       type = DssslSpecEventHandler::DeclarationElement::features;
     else if (event.name() == "BASESET-ENCODING")
       type = DssslSpecEventHandler::DeclarationElement::basesetEncoding;
     else if (event.name() == "LITERAL-DESCRIBED-CHAR")
       type = DssslSpecEventHandler::DeclarationElement::literalDescribedChar;
     else if (event.name() == "ADD-NAME-CHARS")
       type = DssslSpecEventHandler::DeclarationElement::addNameChars;
     else if (event.name() == "ADD-SEPARATOR-CHARS")
       type = DssslSpecEventHandler::DeclarationElement::addSeparatorChars;
     else if (event.name() == "STANDARD-CHARS")
       type = DssslSpecEventHandler::DeclarationElement::standardChars;
     else if (event.name() == "OTHER-CHARS")
       type = DssslSpecEventHandler::DeclarationElement::otherChars;
     else if (event.name() == "COMBINE-CHAR")
       type = DssslSpecEventHandler::DeclarationElement::combineChar;
     else if (event.name() == "MAP-SDATA-ENTITY")
       type = DssslSpecEventHandler::DeclarationElement::mapSdataEntity;
     else if (event.name() == "CHAR-REPERTOIRE")
       type = DssslSpecEventHandler::DeclarationElement::charRepertoire;
     else if (event.name() == "SGML-GROVE-PLAN")
       type = DssslSpecEventHandler::DeclarationElement::sgmlGrovePlan;
     currentDecl_ = new DeclarationElement(type);
     const StringC *str; 
     if (str = attributeString(event, "NAME"))
        currentDecl_->setName(*str);
     if (str = attributeString(event, "TEXT"))
        currentDecl_->setText(*str);
     if (str = attributeString(event, "MODADD"))
        currentDecl_->setModadd(*str);
     if (str = attributeString(event, "DESC"))
        currentDecl_->setDesc(*str);
   }
}

void DssslSpecEventHandler::declarationEnd(const EndElementEvent &event) 
{ 
   if (gatheringBody_ && currentDecl_) { 
     currentDecl_->setContent(currentBody_);
     if (currentPart_) 
	currentPart_->append(currentDecl_); 
     else 
       currentDoc_->append(currentDecl_); 
     gatheringBody_ = 0; 
     currentDecl_ = 0;
   } 
}

TextInputSourceOrigin::TextInputSourceOrigin(Text &text)
{
  text_.swap(text);
}

Boolean TextInputSourceOrigin::defLocation(Offset off, const Origin *&origin, Index &index) const
{
  return text_.charLocation(off, origin, index);
}

void TextInputSourceOrigin::noteCharRef(Index, const NamedCharRef &)
{
  CANNOT_HAPPEN();
}

void TextInputSourceOrigin::setExternalInfo(ExternalInfo *)
{
  CANNOT_HAPPEN();
}

InputSourceOrigin *TextInputSourceOrigin::copy() const
{
  return new TextInputSourceOrigin(*this);
}

const Location &TextInputSourceOrigin::parent() const
{
  return refLocation_;
}

DssslSpecEventHandler::Doc::Doc()
: loaded_(0)
{
}

DssslSpecEventHandler::Doc::Doc(const StringC &sysid)
: sysid_(sysid), loaded_(0)
{
}

void DssslSpecEventHandler::Doc::setLocation(const Location &loc)
{
  loc_ = loc;
}

DssslSpecEventHandler::Part *
DssslSpecEventHandler::Doc::resolveFirstPart(DssslSpecEventHandler &eh)
{
  load(eh);
  PartHeader *header = 0;
  for (IListIter<PartHeader> iter(headers_); !iter.done(); iter.next())
    header = iter.cur();
  if (!header) {
    if (!loc_.origin().isNull()) {
      eh.mgr_->setNextLocation(loc_);
      eh.mgr_->message(InterpreterMessages::noParts);
    }
    return 0;
  }
  return header->resolve(eh);
}

void DssslSpecEventHandler::Doc::load(DssslSpecEventHandler &eh)
{
  if (loaded_)
    return;
  loaded_ = 1;
  if (sysid_.size() > 0) {
    SgmlParser::Params params;
    params.parent = eh.parser_;
    params.sysid = sysid_;
    SgmlParser specParser(params);
    eh.loadDoc(specParser, *this);
  }
  else
    eh.loadDoc(*eh.parser_, *this);
}

DssslSpecEventHandler::PartHeader *
DssslSpecEventHandler::Doc::refPart(const StringC &id)
{
  for (IListIter<PartHeader> iter(headers_); !iter.done(); iter.next())
    if (iter.cur()->id() == id)
      return iter.cur();
  PartHeader *header = new PartHeader(this, id);
  headers_.insert(header);
  return header;
}

DssslSpecEventHandler::PartHeader *
DssslSpecEventHandler::Doc::refPart(const StringC &id, const Location &refLoc)
{
  PartHeader *header = refPart(id);
  header->setRefLoc(refLoc);
  return header;
}

void
DssslSpecEventHandler::Doc::append(DeclarationElement *decl)
{
  declarations_.append(decl);
}

DssslSpecEventHandler::BodyElement::~BodyElement()
{
}

DssslSpecEventHandler::ImmediateBodyElement::ImmediateBodyElement(Text &text)
{
  text_.swap(text);
}

void DssslSpecEventHandler
::ImmediateBodyElement::makeInputSource(DssslSpecEventHandler &, Owner<InputSource> &in)
{
  TextInputSourceOrigin *origin = new TextInputSourceOrigin(text_);
  in = new InternalInputSource(origin->text().string(), origin);
}

DssslSpecEventHandler::DeclarationElement::DeclarationElement(Type type) 
 : type_(type)
{
}

void DssslSpecEventHandler
::DeclarationElement::setContent(Text &content) 
{
  content_.swap(content);
}

void DssslSpecEventHandler
::DeclarationElement::makeInputSource(DssslSpecEventHandler &, Owner<InputSource> &in)
{
  TextInputSourceOrigin *origin = new TextInputSourceOrigin(content_);
  in = new InternalInputSource(origin->text().string(), origin);
}

DssslSpecEventHandler::DeclarationElement::Type 
DssslSpecEventHandler::DeclarationElement::type() const 
{ 
  return type_; 
}

DssslSpecEventHandler
::EntityBodyElement::EntityBodyElement(const ConstPtr<Entity> &entity)
: entity_(entity)
{
}

void DssslSpecEventHandler
::EntityBodyElement::makeInputSource(DssslSpecEventHandler &eh,
				     Owner<InputSource> &in)
{
  const InternalEntity *internal = entity_->asInternalEntity();
  if (internal) {
    in = new InternalInputSource(internal->string(),
			         EntityOrigin::make(entity_, Location()));
    return;
  }
  const StringC &sysid
    = entity_->asExternalEntity()->externalId().effectiveSystemId();
  if (sysid.size())
    in = eh.parser_->entityManager().open(sysid, *eh.charset_, InputSourceOrigin::make(),
					  0, *eh.mgr_);
}

DssslSpecEventHandler::PartHeader::PartHeader(Doc *doc, const StringC &id)
: doc_(doc), id_(id)
{
}

void DssslSpecEventHandler::PartHeader::setRefLoc(const Location &loc)
{
  if (refLoc_.origin().isNull())
    refLoc_ = loc;
}

DssslSpecEventHandler::Part *
DssslSpecEventHandler::PartHeader::resolve(DssslSpecEventHandler &eh)
{
  doc_->load(eh);
  if (!specPart_) {
    eh.mgr_->setNextLocation(refLoc_);
    eh.mgr_->message(InterpreterMessages::missingPart, StringMessageArg(id_));
    return 0;
  }
  return specPart_->resolve(eh);
}

DssslSpecEventHandler::SpecPart::~SpecPart()
{
}

DssslSpecEventHandler::ExternalPart::ExternalPart(PartHeader *header)
: header_(header)
{
}

DssslSpecEventHandler::Part *
DssslSpecEventHandler::ExternalPart::resolve(DssslSpecEventHandler &eh)
{
  return header_->resolve(eh);
}

DssslSpecEventHandler::ExternalFirstPart::ExternalFirstPart(Doc *doc)
: doc_(doc)
{
}

DssslSpecEventHandler::Part *
DssslSpecEventHandler::ExternalFirstPart::resolve(DssslSpecEventHandler &eh)
{
  return doc_->resolveFirstPart(eh);
}

DssslSpecEventHandler::Part::Part(Doc *doc)
: mark_(0), doc_(doc)
{
}

DssslSpecEventHandler::Part *
DssslSpecEventHandler::Part::resolve(DssslSpecEventHandler &)
{
  return this;
}

void DssslSpecEventHandler::Part::append(BodyElement *element)
{
  bodyElements_.append(element);
}

void DssslSpecEventHandler::Part::append(DeclarationElement *element)
{
  declarations_.append(element);
}

DssslSpecEventHandler::Doc *DssslSpecEventHandler::Part::doc()
{
  return doc_;
}

#ifdef DSSSL_NAMESPACE
}
#endif
