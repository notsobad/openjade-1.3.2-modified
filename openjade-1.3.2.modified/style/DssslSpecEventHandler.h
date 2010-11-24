// Copyright (c) 1996 James Clark
// See the file copying.txt for copying permission.

#ifndef DssslSpecEventHandler_INCLUDED
#define DssslSpecEventHandler_INCLUDED 1

#include "ErrorCountEventHandler.h"
#include "ArcEngine.h"
#include "Message.h"
#include "Text.h"
#include "Owner.h"
#include "Boolean.h"
#include "InputSource.h"
#include "Vector.h"
#include "NCVector.h"
#include "IList.h"
#include "IListIter.h"
#include "StringC.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

class DssslSpecEventHandler
: private ErrorCountEventHandler, private ArcDirector {
public:
  class BodyElement : public Link {
  public:
    virtual ~BodyElement();
    virtual void makeInputSource(DssslSpecEventHandler &, Owner<InputSource> &) = 0;
  };

  class ImmediateBodyElement : public BodyElement {
  public:
    ImmediateBodyElement(Text &);
    void makeInputSource(DssslSpecEventHandler &, Owner<InputSource> &);
  private:
    Text text_;
  };

  class EntityBodyElement : public BodyElement {
  public:
    EntityBodyElement(const ConstPtr<Entity> &);
    void makeInputSource(DssslSpecEventHandler &, Owner<InputSource> &);
  private:
    ConstPtr<Entity> entity_;
  };

  class SpecPart;
  class Doc;
  class Part;
  class MapSdataEntityElement;

  class DeclarationElement : public Link {
  public:
    enum Type {
      features,
      basesetEncoding,
      literalDescribedChar,
      addNameChars,
      addSeparatorChars,
      standardChars,
      otherChars,
      combineChar,
      mapSdataEntity,
      charRepertoire,
      sgmlGrovePlan,
    };

    DeclarationElement(Type);
    void makeInputSource(DssslSpecEventHandler&, Owner<InputSource>&);
    Type type() const;
    void setContent(Text &);
    void setName(const StringC &s) { name_ = s; };
    const StringC &name() { return name_; };
    void setText(const StringC &s) { text_ = s; };
    const StringC &text() { return text_; };
    void setModadd(const StringC &s) { modadd_ = s; };
    const StringC &modadd() { return modadd_; };
    void setDesc(const StringC &s) { desc_ = s; };
    const StringC &desc() { return desc_; };

  private:
    Type type_;
    Text content_;
    StringC name_;
    StringC text_;
    StringC modadd_;
    StringC desc_;
  };

  class PartHeader : public Link {
  public:
    PartHeader(Doc *, const StringC &id);
    const StringC &id() const;
    Part *resolve(DssslSpecEventHandler &);
    void setPart(SpecPart *);
    void setRefLoc(const Location &);
  private:
    Doc *doc_;
    StringC id_;
    // Location of first reference
    Location refLoc_;
    Owner<SpecPart> specPart_;
  };


  class SpecPart {
  public:
    virtual ~SpecPart();
    virtual Part *resolve(DssslSpecEventHandler &) = 0;
  };

  class ExternalPart : public SpecPart {
  public:
    ExternalPart(PartHeader *);
    Part *resolve(DssslSpecEventHandler &);
  private:
    PartHeader *header_;
  };

  class ExternalFirstPart : public SpecPart {
  public:
    ExternalFirstPart(Doc *);
    Part *resolve(DssslSpecEventHandler &);
  private:
    Doc *doc_;
  };

  class Part : public SpecPart {
  public:
    typedef IListIter<BodyElement> Iter;
    typedef IListIter<DeclarationElement> DIter;
    Part(Doc *);
    Iter iter();
    DIter diter();
    Doc *doc();
    const Vector<PartHeader *> &use() const;
    void addUse(PartHeader *);
    void append(BodyElement *);
    void append(DeclarationElement *);
    bool setMark(bool = 1);
  private:
    Part *resolve(DssslSpecEventHandler &);
    IList<DeclarationElement> declarations_;
    IList<BodyElement> bodyElements_;
    Vector<PartHeader *> use_;
    bool mark_;
    Doc *doc_;
  };

  class Doc : public Link {
  public:
    Doc();
    Doc(const StringC &sysid);
    void setLocation(const Location &);
    PartHeader *refPart(const StringC &);
    PartHeader *refPart(const StringC &, const Location &refLoc);
    Part *resolveFirstPart(DssslSpecEventHandler &);
    Part::DIter diter();
    void load(DssslSpecEventHandler &);
    void append(DeclarationElement *); 
    const StringC &sysid() const;
  private:
    bool loaded_;
    StringC sysid_;
    IList<DeclarationElement> declarations_;
    IList<PartHeader> headers_;
    Location loc_;
    friend class Part;
  };
  DssslSpecEventHandler(Messenger &);
  void load(SgmlParser &specParser, const CharsetInfo &, const StringC &id,
	    Vector<Part *> &parts);
  void externalSpecificationStart(const StartElementEvent &);
  void externalSpecificationEnd(const EndElementEvent &);
  void styleSpecificationStart(const StartElementEvent &);
  void styleSpecificationEnd(const EndElementEvent &);
  void styleSpecificationBodyStart(const StartElementEvent &);
  void styleSpecificationBodyEnd(const EndElementEvent &);
  void declarationStart(const StartElementEvent &);
  void declarationEnd(const EndElementEvent &);
private:
  Vector<Part *> &parts();
  void startElement(StartElementEvent *);
  void endElement(EndElementEvent *);
  void data(DataEvent *);
  void message(MessageEvent *);
  void endProlog(EndPrologEvent *);
  EventHandler *arcEventHandler(const StringC *,
		  		const Notation *,
				const Vector<StringC> &,
				const SubstTable *);
  void loadDoc(SgmlParser &, Doc &);
  void resolveParts(Part *, Vector<Part *> &);
  Doc *findDoc(const StringC &);
  const StringC *attributeString(const StartElementEvent &, const char *);
  const Text *attributeText(const StartElementEvent &, const char *);
  ConstPtr<Entity> attributeEntity(const StartElementEvent &, const char *);

  Messenger *mgr_;
  bool gotArc_;
  bool gatheringBody_;
  Part *currentPart_;
  Text currentBody_;
  Doc *currentDoc_;
  IList<Doc> docs_;
  SgmlParser *parser_;
  const CharsetInfo *charset_;
  DeclarationElement *currentDecl_;
  friend class Doc;
  friend class EntityBodyElement;
  friend class PartHeader;
};

inline
const StringC &DssslSpecEventHandler::PartHeader::id() const
{
  return id_;
}

inline
void DssslSpecEventHandler::PartHeader::setPart(SpecPart *part)
{
  specPart_ = part;
}

inline
void DssslSpecEventHandler::Part::addUse(PartHeader *header)
{
  use_.push_back(header);
}
    
inline
const Vector<DssslSpecEventHandler::PartHeader *> &
DssslSpecEventHandler::Part::use() const
{
  return use_;
}

inline
const StringC &DssslSpecEventHandler::Doc::sysid() const
{
  return sysid_;
}

inline
DssslSpecEventHandler::Part::Iter DssslSpecEventHandler::Part::iter()
{
  return Iter(bodyElements_);
}

inline
DssslSpecEventHandler::Part::DIter DssslSpecEventHandler::Part::diter()
{
  return DIter(declarations_);
}

inline
DssslSpecEventHandler::Part::DIter DssslSpecEventHandler::Doc::diter()
{
  return Part::DIter(declarations_);
}

inline
bool DssslSpecEventHandler::Part::setMark(bool b)
{
  bool tem = mark_;
  mark_ = b;
  return tem;
}

#ifdef DSSSL_NAMESPACE
}
#endif

#endif /* not DssslSpecEventHandler_INCLUDED */
