// Copyright (c) 1996 James Clark
// See the file COPYING for copying permission.

#ifdef __GNUG__
#pragma implementation
#endif

#include "config.h"
#include "Boolean.h"
#include "Node.h"
#include "macros.h"
#include <string.h>
#include <assert.h>

#ifdef GROVE_NAMESPACE
namespace GROVE_NAMESPACE {
#endif

bool Node::queryInterface(IID, const void *&) const
{
  return 0;
}

AccessResult Node::getMessages(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getSeverity(Severity &) const
{
  return accessNotInClass;
}

AccessResult Node::getOrigin(NodePtr &) const
{
  return accessNull;
}

AccessResult Node::getParent(NodePtr &) const
{
  return accessNull;
}

AccessResult Node::getGroveRoot(NodePtr &) const
{
  return accessNull;
}

AccessResult Node::getTreeRoot(NodePtr &nd) const
{
  // FIXME avoid cast -- need copy method
  nd.assign((Node *)this);
  for (;;) {
    AccessResult res = nd->getParent(nd);
    if (res != accessOK) {
      if (res == accessTimeout)
	return res;
      break;
    }
  }
  return accessOK;
}

AccessResult Node::getAttributes(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getName(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getSystemData(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getEntity(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getEntityName(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getExternalId(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getNotation(NodePtr &) const
{
  return accessNotInClass;
}
AccessResult Node::getText(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getNotationName(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getEntityType(EntityType::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getDefaulted(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getPublicId(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getSystemId(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getGeneratedSystemId(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getValue(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getTokenSep(GroveChar &) const
{
  return accessNotInClass;
}

AccessResult Node::getImplied(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getAttributeDef(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getCurrentAttributeIndex(long &) const
{
  return accessNotInClass;
}

AccessResult Node::getCurrentGroup(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getDeclValueType(DeclValueType::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getDefaultValueType(DefaultValueType::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getDefaultValue(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getTokens(GroveStringListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getGi(GroveString &) const
{
  return accessNotInClass;
}

bool Node::hasGi(GroveString) const
{
  return 0;
}

AccessResult Node::getId(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getContent(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getIncluded(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getMustOmitEndTag(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getAttributeDefs(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getContentType(ContentType::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getExclusions(GroveStringListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getInclusions(GroveStringListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getModelGroup(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getOmitEndTag(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getOmitStartTag(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getConnector(Connector::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getOccurIndicator(OccurIndicator::Enum &) const
{
  return accessNotInClass;
}

AccessResult Node::getContentTokens(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getDefaultEntity(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getElementType(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getParameterEntities(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getToken(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getReferent(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getGoverning(bool &) const
{
  return accessNotInClass;
}

AccessResult Node::getGeneralEntities(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getNotations(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getElementTypes(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getSgmlConstants(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getApplicationInfo(GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::getProlog(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getEpilog(NodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getDocumentElement(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getElements(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getEntities(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getDefaultedEntities(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getGoverningDoctype(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getDoctypesAndLinktypes(NamedNodeListPtr &) const
{
  return accessNotInClass;
}

AccessResult Node::getNonSgml(unsigned long &) const
{
  return accessNotInClass;
}

AccessResult Node::nextSibling(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::nextChunkAfter(NodePtr &nd) const
{
  AccessResult ret = firstChild(nd);
  switch (ret) {
  case accessOK:
  case accessTimeout:
    return ret;
  default:
    break;
  }
  for (;;) {
    ret = nextChunkSibling(nd);
    switch (ret) {
    case accessOK:
    case accessTimeout:
      return ret;
    default:
      break;
    }
    ret = getParent(nd);
    if (ret != accessOK)
      break;
  }
  return ret;
}

AccessResult Node::nextChunkSibling(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::firstChild(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::charChunk(const SdataMapper &, GroveString &) const
{
  return accessNotInClass;
}

AccessResult Node::firstSibling(NodePtr &) const
{
  return accessNotInClass;
}

AccessResult Node::siblingsIndex(unsigned long &) const
{
  return accessNotInClass;
}

AccessResult Node::tokens(GroveString &) const
{
  return accessNotInClass;
}

unsigned long Node::hash() const
{
  // Hopefully implementations will do better.
  return 0;
}

AccessResult Node::elementIndex(unsigned long &) const
{
  return accessNotInClass;
}

bool Node::chunkContains(const Node &nd) const
{
  return *this == nd;
}

AccessResult Node::attributeRef(unsigned long n, NodePtr &ptr) const
{
  NamedNodeListPtr atts;
  AccessResult ret = getAttributes(atts);
  if (ret != accessOK)
    return ret;
  return atts->nodeList()->ref(n, ptr);
}

AccessResult Node::followSiblingRef(unsigned long n, NodePtr &ptr) const
{
  if (n == 0)
    return nextSibling(ptr);
  NodePtr tem;
  AccessResult ret = nextSibling(tem);
  if (ret != accessOK)
    return ret;
  while (--n > 0) {
    ret = tem.assignNextSibling();
    if (ret != accessOK)
      return ret;
  }
  return tem->nextSibling(ptr);
}

AccessResult Node::property(ComponentName::Id id,
			    const SdataMapper &mapper,
			    PropertyValue &value) const
{
  AccessResult ret;
  switch (id) {
  default:
    ret = accessNotInClass;
    break;
  case ComponentName::idEntityType:
    {
      EntityType::Enum type;
      ret = getEntityType(type);
      if (ret == accessOK) {
	switch (type) {
	  case EntityType::text: value.set(ComponentName::idText); break;
	  case EntityType::cdata: value.set(ComponentName::idCdata); break;
	  case EntityType::sdata: value.set(ComponentName::idSdata); break;
	  case EntityType::ndata: value.set(ComponentName::idNdata); break;
	  case EntityType::pi: value.set(ComponentName::idPi); break;
	  case EntityType::subdocument: value.set(ComponentName::idSubdocument); break;
	  default:
	    ret = accessNotInClass;
	}
      }
      break;
    }
  case ComponentName::idDeclValueType:
    {
      DeclValueType::Enum type;
      ret = getDeclValueType(type);
      if (ret == accessOK) {
	switch (type) {
          case DeclValueType::cdata: value.set(ComponentName::idCdata); break;
          case DeclValueType::entity: value.set(ComponentName::idEntity); break;
          case DeclValueType::entities: value.set(ComponentName::idEntities); break;
          case DeclValueType::id: value.set(ComponentName::idId); break;
          case DeclValueType::idref: value.set(ComponentName::idIdref); break;
          case DeclValueType::idrefs: value.set(ComponentName::idIdrefs); break;
          case DeclValueType::name: value.set(ComponentName::idName); break;
          case DeclValueType::names: value.set(ComponentName::idNames); break;
          case DeclValueType::nmtoken: value.set(ComponentName::idNmtoken); break;
          case DeclValueType::nmtokens: value.set(ComponentName::idNmtokens); break;
          case DeclValueType::number: value.set(ComponentName::idNumber); break;
          case DeclValueType::numbers: value.set(ComponentName::idNumbers); break;
          case DeclValueType::nutoken: value.set(ComponentName::idNutoken); break;
          case DeclValueType::nutokens: value.set(ComponentName::idNutokens); break;
          case DeclValueType::notation: value.set(ComponentName::idNotation); break;
          case DeclValueType::nmtkgrp: value.set(ComponentName::idNmtkgrp); break;
        default:
	  ret = accessNotInClass;
	}
      }
      break;
    }
  case ComponentName::idDefaultValueType:
    {
      DefaultValueType::Enum type;
      ret = getDefaultValueType(type);
      if (ret == accessOK) {
	switch (type) {
          case DefaultValueType::value: value.set(ComponentName::idValue); break;
          case DefaultValueType::fixed: value.set(ComponentName::idFixed); break;
          case DefaultValueType::required: value.set(ComponentName::idRequired); break;
          case DefaultValueType::current: value.set(ComponentName::idCurrent); break;
          case DefaultValueType::conref: value.set(ComponentName::idConref); break;
          case DefaultValueType::implied: value.set(ComponentName::idImplied); break;
        default:
	  ret = accessNotInClass;
	}
      }
      break;
    }
  case ComponentName::idContentType:
    {
      ContentType::Enum type;
      ret = getContentType(type);
      if (ret == accessOK) {
	switch (type) {
          case ContentType::cdata: value.set(ComponentName::idCdata); break;
          case ContentType::rcdata: value.set(ComponentName::idRcdata); break;
          case ContentType::empty: value.set(ComponentName::idEmpty); break;
          case ContentType::any: value.set(ComponentName::idAny); break;
          case ContentType::modelgrp: value.set(ComponentName::idModelGroup); break;
        default:
	  ret = accessNotInClass;
	}
      }
      break;
    }
  case ComponentName::idConnector:
    {
      Connector::Enum type;
      ret = getConnector(type);
      if (ret == accessOK) {
	switch (type) {
          case Connector::and_: value.set(ComponentName::idAnd); break;
          case Connector::or_: value.set(ComponentName::idOr); break;
          case Connector::seq: value.set(ComponentName::idSeq); break;
        default:
	  ret = accessNotInClass;
	}
      }
      break;
    }
  case ComponentName::idChar:
    {
      GroveChar tem;
      ret = getChar(mapper, tem);
      if (ret == accessOK)
	value.set(tem);
      break;
    }
#define PROP(Name, Type) \
  case ComponentName::id##Name: \
    { \
      Type tem; \
      ret = get##Name(tem); \
      if (ret == accessOK) \
	value.set(tem); \
      break; \
    }
#define PROP_BOOLEAN(name) PROP(name, bool)
#define PROP_CHAR(name) PROP(name, GroveChar)
#define PROP_COMPNAME(name) PROP(name, ComponentName::Id)
#define PROP_CNMLIST(name) PROP(name, const ComponentName::Id *)
#define PROP_STRING(name) PROP(name, GroveString)
#define PROP_NODE(name) PROP(name, NodePtr)
#define PROP_NODELIST(name) PROP(name, NodeListPtr)
#define PROP_NMNDLIST(name) PROP(name, NamedNodeListPtr)
#define PROP_STRINGLIST(name) PROP(name, GroveStringListPtr)
#define PROP_INTEGER(name) PROP(name, long)
  PROP_COMPNAME(ClassName)
  PROP_COMPNAME(ChildrenPropertyName)
  PROP_COMPNAME(DataPropertyName)
  PROP_COMPNAME(DataSepPropertyName)
  PROP_COMPNAME(OriginToSubnodeRelPropertyName)
  PROP_CNMLIST(SubnodePropertyNames)
  PROP_CNMLIST(AllPropertyNames)
  PROP_BOOLEAN(Defaulted)
  PROP_BOOLEAN(Governing)
  PROP_BOOLEAN(Implied)
  PROP_BOOLEAN(Included)
  PROP_BOOLEAN(MustOmitEndTag)
  PROP_BOOLEAN(OmitEndTag)
  PROP_BOOLEAN(OmitStartTag)
  PROP_CHAR(TokenSep)
  PROP_NMNDLIST(Attributes)
  PROP_NMNDLIST(DefaultedEntities)
  PROP_NMNDLIST(DoctypesAndLinktypes)
  PROP_NMNDLIST(Elements)
  PROP_NMNDLIST(Entities)
  PROP_NMNDLIST(GeneralEntities)
  PROP_NMNDLIST(Notations)
  PROP_NMNDLIST(AttributeDefs)
  PROP_NMNDLIST(ElementTypes)
  PROP_NMNDLIST(ParameterEntities)
  PROP_NODE(DocumentElement)
  PROP_NODE(Entity)
  PROP_NODE(ExternalId)
  PROP_NODE(GoverningDoctype)
  PROP_NODE(GroveRoot)
  PROP_NODE(Notation)
  PROP_NODE(Origin)
  PROP_NODE(Parent)
  PROP_NODE(Referent)
  PROP_NODE(SgmlConstants)
  PROP_NODE(TreeRoot)
  PROP_NODE(ModelGroup)
  PROP_NODE(DefaultEntity)
  PROP_NODE(ElementType)
  PROP_NODELIST(Content)
  PROP_NODELIST(Epilog)
  PROP_NODELIST(Prolog)
  PROP_NODELIST(Value)
  PROP_NODELIST(ContentTokens)
  PROP_NODELIST(DefaultValue)
  PROP_NODELIST(CurrentGroup)
  PROP_STRING(ApplicationInfo)
  PROP_STRING(EntityName)
  PROP_STRING(GeneratedSystemId)
  PROP_STRING(Gi)
  PROP_STRING(Id)
  PROP_STRING(Name)
  PROP_STRING(NotationName)
  PROP_STRING(PublicId)
  PROP_STRING(SystemData)
  PROP_STRING(SystemId)
  PROP_STRING(Text)
  PROP_STRING(Token)
  PROP_STRINGLIST(Exclusions)
  PROP_STRINGLIST(Inclusions)
  PROP_STRINGLIST(Tokens)
  PROP_INTEGER(CurrentAttributeIndex)
}
#undef PROP
#undef PROP_BOOLEAN
#undef PROP_CHAR
#undef PROP_NMNDLIST
#undef PROP_NODE
#undef PROP_NODELIST
#undef PROP_STRING
  return ret;
}

AccessResult NodeList::ref(unsigned long n, NodePtr &ptr) const
{
  if (n == 0)
    return first(ptr);
  NodeListPtr tem;
  AccessResult ret = rest(tem);
  if (ret != accessOK)
    return ret;
  while (--n > 0) {
    ret = tem.assignRest();
    if (ret != accessOK)
      return ret;
  }
  return tem->first(ptr);
}

NodeListPtr NamedNodeList::nodeListNoOrder() const
{
  return nodeList();
}

struct NodeNameNodeVisitor : public NodeVisitor {
  NodeNameNodeVisitor(NamedNodeList::Type t, GroveString &name)
    : ret(accessNotInClass), type(t), nameP(&name) { }
  AccessResult ret;
  GroveString *nameP;
  NamedNodeList::Type type;
  void element(Node &nd) {
    if (type == NamedNodeList::elements)
      ret = nd.getId(*nameP);
  }
  void attributeAssignment(Node &nd) {
    if (type == NamedNodeList::attributes)
      ret = nd.getName(*nameP);
  }
  void documentType(Node &nd) {
    if (type == NamedNodeList::doctypesAndLinktypes)
      ret = nd.getName(*nameP);
  }
  void entity(Node &nd) {
    if (type == NamedNodeList::entities)
      ret = nd.getName(*nameP);
  }
  void notation(Node &nd) {
    if (type == NamedNodeList::notations)
      ret = nd.getName(*nameP);
  }
  void elementType(Node &nd) {
    if (type == NamedNodeList::elementTypes)
      ret = nd.getGi(*nameP);
  }
  void attributeDef(Node &nd) {
    if (type == NamedNodeList::attributeDefs)
      ret = nd.getName(*nameP);
  }
};

AccessResult NamedNodeList::nodeName(const NodePtr &node, GroveString &name) const
{
  NodeNameNodeVisitor v(type(), name);
  node->accept(v);
  return v.ret;
}

void NodeVisitor::sgmlDocument(Node &)
{
}

void NodeVisitor::sgmlConstants(Node &)
{
}

void NodeVisitor::dataChar(Node &)
{
}

void NodeVisitor::element(Node &)
{
}

void NodeVisitor::attributeAssignment(Node &)
{
}

void NodeVisitor::attributeDef(Node &)
{
}

void NodeVisitor::attributeValueToken(Node &)
{
}

void NodeVisitor::pi(Node &)
{
}

void NodeVisitor::sdata(Node &)
{
}

void NodeVisitor::documentType(Node &)
{
}

void NodeVisitor::entity(Node &)
{
}

void NodeVisitor::notation(Node &)
{
}

void NodeVisitor::externalId(Node &)
{
}

void NodeVisitor::externalData(Node &)
{
}

void NodeVisitor::subdocument(Node &)
{
}

void NodeVisitor::nonSgml(Node &)
{
}

void NodeVisitor::message(Node &)
{
}

void NodeVisitor::elementType(Node &)
{
}

void NodeVisitor::modelGroup(Node &)
{
}

void NodeVisitor::elementToken(Node &)
{
}

void NodeVisitor::pcdataToken(Node &)
{
}

void NodeVisitor::defaultEntity(Node &)
{
}

bool GroveString::operator==(const GroveString &str) const
{
  if (size() != str.size())
    return 0;
  if (size() == 0)
    return 1;
  if (memcmp(data(), str.data(), size() * sizeof(GroveChar)) == 0)
    return 1;
  return 0;
}

void GroveStringList::append(const GroveString &gs)
{
  GroveStringLink **pp;
  for (pp = &head_; *pp; pp = &(*pp)->next_)
    ;
  *pp = new GroveStringLink( gs );
  if (iter_.done())
    iter_.attach(head_);
}

AccessResult GroveStringList::first(GroveString &str) const
{
  if (head_ == 0)
    return accessNull;
  str = head_->data_;
  return accessOK;
}

AccessResult GroveStringList::rest(GroveStringListPtr &ptr) const
{
  if (canReuse(ptr)) {
    GroveStringList *list = (GroveStringList *)this;
    if (list->iter_.done())
      return accessNull;
    list->iter_.next();
    return accessOK;
  }
  ptr.assign(new GroveStringList());
  ConstGroveStringListIter iter(iter_);
  if (iter.done())
    return accessNull;
  iter.next();
  while (!iter.done()) {
    ptr->append(iter.cur());
    iter.next();
  }
  return accessOK;
}

void GroveStringList::release()
{
  assert(refCount_ != 0);
  if (--refCount_ == 0)
    delete this;
}

void GroveStringList::addRef()
{
  ++refCount_;
}

bool GroveStringList::canReuse(GroveStringListPtr &ptr) const
{
  const GroveStringList *tem = &*ptr;
  return tem == this && refCount_ == 1;
}

GroveStringList::~GroveStringList()
{
  GroveStringLink *tmpPtr;
  GroveStringLink *ptr = head_;
  while (ptr)
  {
    tmpPtr = ptr;
    ptr = ptr->next_;
    delete tmpPtr;
  }
}

ConstGroveStringListIter::ConstGroveStringListIter(const GroveStringList &list)
 : link_(list.head_)
{
}

SdataMapper::~SdataMapper()
{
}

bool SdataMapper::sdataMap(GroveString name, GroveString text, GroveChar &) const
{
  return 0;
}

const char *ComponentName::rcsName(Id id)
{
  static const char *const names[] = {
    "allpns",
    "and",
    "any",
    "appinfo",
    "attasgn",
    "attdef",
    "attdefs",
    "atts",
    "attvaltk",
    "cdata",
    "char",
    "childpn",
    "classnm",
    "connect",
    "conref",
    "content",
    "tokens",
    "contype",
    "current",
    "curattix",
    "curgrp",
    "datachar",
    "datapn",
    "dseppn",
    "dcltype",
    "dflted",
    "dfltents",
    "dfltent",
    "dfltval",
    "dflttype",
    "dtlts",
    "docelem",
    "doctype",
    "element",
    "elements",
    "elemtk",
    "elemtype",
    "elemtps",
    "empty",
    "entities",
    "entity",
    "entname",
    "enttype",
    "epilog",
    "excls",
    "extdata",
    "extid",
    "fixed",
    "genents",
    "gensysid",
    "gi",
    "govrning",
    "govdt",
    "grovroot",
    "id",
    "idref",
    "idrefs",
    "implied",
    "included",
    "incls",
    "modelgrp",
    "momitend",
    "name",
    "names",
    "ndata",
    "nmtkgrp",
    "nmtoken",
    "nmtokens",
    "notation",
    "notname",
    "nots",
    "number",
    "numbers",
    "nutoken",
    "nutokens",
    "occur",
    "omitend",
    "omitstrt",
    "opt",
    "or",
    "origin",
    "otsrelpn",
    "parments",
    "parent",
    "pcdatatk",
    "pi",
    "plus",
    "prolog",
    "pubid",
    "rcdata",
    "referent",
    "rep",
    "required",
    "sdata",
    "seq",
    "sgmlcsts",
    "sgmldoc",
    "subdoc",
    "subpns",
    "sysdata",
    "sysid",
    "text",
    "token",
    "tokens",
    "tokensep",
    "treeroot",
    "value"
  };
  if (id < 0 || id >= SIZEOF(names))
    return 0;
  return names[id];
}

const char *ComponentName::sdqlName(Id id)
{
  static const char *const names[] = {
    "all-property-names",
    "and",
    "any",
    "application-info",
    "attribute-assignment",
    "attribute-def",
    "attribute-defs",
    "attributes",
    "attribute-value-token",
    "cdata",
    "char",
    "children-property-name",
    "class-name",
    "connector",
    "conref",
    "content",
    "content-tokens",
    "content-type",
    "current",
    "current-attribute-index",
    "current-group",
    "data-char",
    "data-property-name",
    "data-sep-property-name",
    "decl-value-type",
    "defaulted?",
    "defaulted-entities",
    "default-entity",
    "default-value",
    "default-value-type",
    "doctypes-and-linktypes",
    "document-element",
    "document-type",
    "element",
    "elements",
    "element-token",
    "element-type",
    "element-types",
    "empty",
    "entities",
    "entity",
    "entity-name",
    "entity-type",
    "epilog",
    "exclusions",
    "external-data",
    "external-id",
    "fixed",
    "general-entities",
    "generated-system-id",
    "gi",
    "governing?",
    "governing-doctype",
    "grove-root",
    "id",
    "idref",
    "idrefs",
    "implied?",
    "included?",
    "inclusions",
    "model-group",
    "must-omit-end-tag?",
    "name",
    "names",
    "ndata",
    "name-token-group",
    "nmtoken",
    "nmtokens",
    "notation",
    "notation-name",
    "notations",
    "number",
    "numbers",
    "nutoken",
    "nutokens",
    "occur-indicator",
    "omit-end-tag?",
    "omit-start-tag?",
    "opt",
    "or",
    "origin",
    "origin-to-subnode-rel-property-name",
    "parameter-entities",
    "parent",
    "pcdata-token",
    "pi",
    "plus",
    "prolog",
    "public-id",
    "rcdata",
    "referent",
    "rep",
    "required",
    "sdata",
    "seq",
    "sgml-constants",
    "sgml-document",
    "subdocument",
    "subnode-property-names",
    "system-data",
    "system-id",
    "text",
    "token",
    "tokens",
    "token-sep",
    "tree-root",
    "value"
  };
  if (id < 0 || id >= SIZEOF(names))
    return 0;
  return names[id];
}

#define INTRINSIC_PROPS \
  ComponentName::idClassName, \
  ComponentName::idGroveRoot, \
  ComponentName::idSubnodePropertyNames, \
  ComponentName::idAllPropertyNames, \
  ComponentName::idChildrenPropertyName, \
  ComponentName::idDataPropertyName, \
  ComponentName::idDataSepPropertyName, \
  ComponentName::idParent, \
  ComponentName::idTreeRoot, \
  ComponentName::idOrigin, \
  ComponentName::idOriginToSubnodeRelPropertyName

  static const ComponentName::Id noProps[] = { ComponentName::noId };

static const ComponentName::Id allProps_externalId[] = {
  INTRINSIC_PROPS,
  ComponentName::idPublicId,
  ComponentName::idSystemId,
  ComponentName::idGeneratedSystemId,
  ComponentName::noId
};
const ClassDef ClassDef::externalId = {
  ComponentName::idExternalId,
  allProps_externalId,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_documentType[] = {
  INTRINSIC_PROPS,
  ComponentName::idName,
  ComponentName::idElementTypes,
  ComponentName::idGoverning,
  ComponentName::idGeneralEntities,
  ComponentName::idNotations,
  ComponentName::idDefaultEntity,
  ComponentName::idParameterEntities,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_documentType[] = {
  ComponentName::idGeneralEntities,
  ComponentName::idNotations,
  ComponentName::idElementTypes,
  ComponentName::idDefaultEntity,
  ComponentName::idParameterEntities,
  ComponentName::noId
};
const ClassDef ClassDef::documentType = {
  ComponentName::idDocumentType,
  allProps_documentType,
  subnodeProps_documentType,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_attributeValueToken[] = {
  INTRINSIC_PROPS,
  ComponentName::idToken,
  ComponentName::idEntity,
  ComponentName::idNotation,
  ComponentName::idReferent,
  ComponentName::noId
};
const ClassDef ClassDef::attributeValueToken = {
  ComponentName::idAttributeValueToken,
  allProps_attributeValueToken,
  noProps,
  ComponentName::noId,
  ComponentName::idToken,
  ComponentName::noId
};
static const ComponentName::Id allProps_sgmlDocument[] = {
  INTRINSIC_PROPS,
  ComponentName::idSgmlConstants,
  ComponentName::idApplicationInfo,
  ComponentName::idProlog,
  ComponentName::idEpilog,
  ComponentName::idGoverningDoctype,
  ComponentName::idDoctypesAndLinktypes,
  ComponentName::idDocumentElement,
  ComponentName::idElements,
  ComponentName::idEntities,
  ComponentName::idDefaultedEntities,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_sgmlDocument[] = {
  ComponentName::idSgmlConstants,
  ComponentName::idProlog,
  ComponentName::idEpilog,
  ComponentName::idDoctypesAndLinktypes,
  ComponentName::idDocumentElement,
  ComponentName::idDefaultedEntities,
  ComponentName::noId
};
const ClassDef ClassDef::sgmlDocument = {
  ComponentName::idSgmlDocument,
  allProps_sgmlDocument,
  subnodeProps_sgmlDocument,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_dataChar[] = {
  INTRINSIC_PROPS,
  ComponentName::idChar,
  ComponentName::noId
};
const ClassDef ClassDef::dataChar = {
  ComponentName::idDataChar,
  allProps_dataChar,
  noProps,
  ComponentName::noId,
  ComponentName::idChar,
  ComponentName::noId
};
static const ComponentName::Id allProps_subdocument[] = {
  INTRINSIC_PROPS,
  ComponentName::idEntityName,
  ComponentName::idEntity,
  ComponentName::noId
};
const ClassDef ClassDef::subdocument = {
  ComponentName::idSubdocument,
  allProps_subdocument,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_pi[] = {
  INTRINSIC_PROPS,
  ComponentName::idSystemData,
  ComponentName::idEntityName,
  ComponentName::idEntity,
  ComponentName::noId
};
const ClassDef ClassDef::pi = {
  ComponentName::idPi,
  allProps_pi,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_element[] = {
  INTRINSIC_PROPS,
  ComponentName::idGi,
  ComponentName::idId,
  ComponentName::idAttributes,
  ComponentName::idContent,
  ComponentName::idIncluded,
  ComponentName::idMustOmitEndTag,
  ComponentName::idElementType,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_element[] = {
  ComponentName::idAttributes,
  ComponentName::idContent,
  ComponentName::noId
};
const ClassDef ClassDef::element = {
  ComponentName::idElement,
  allProps_element,
  subnodeProps_element,
  ComponentName::idContent,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_notation[] = {
  INTRINSIC_PROPS,
  ComponentName::idName,
  ComponentName::idExternalId,
  ComponentName::idAttributeDefs,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_notation[] = {
  ComponentName::idExternalId,
  ComponentName::idAttributeDefs,
  ComponentName::noId
};
const ClassDef ClassDef::notation = {
  ComponentName::idNotation,
  allProps_notation,
  subnodeProps_notation,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_externalData[] = {
  INTRINSIC_PROPS,
  ComponentName::idEntityName,
  ComponentName::idEntity,
  ComponentName::noId
};
const ClassDef ClassDef::externalData = {
  ComponentName::idExternalData,
  allProps_externalData,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_attributeAssignment[] = {
  INTRINSIC_PROPS,
  ComponentName::idAttributeDef,
  ComponentName::idValue,
  ComponentName::idName,
  ComponentName::idImplied,
  ComponentName::idTokenSep,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_attributeAssignment[] = {
  ComponentName::idValue,
  ComponentName::noId
};
const ClassDef ClassDef::attributeAssignment = {
  ComponentName::idAttributeAssignment,
  allProps_attributeAssignment,
  subnodeProps_attributeAssignment,
  ComponentName::idValue,
  ComponentName::noId,
  ComponentName::idTokenSep
};
static const ComponentName::Id allProps_sdata[] = {
  INTRINSIC_PROPS,
  ComponentName::idSystemData,
  ComponentName::idChar,
  ComponentName::idEntityName,
  ComponentName::idEntity,
  ComponentName::noId
};
const ClassDef ClassDef::sdata = {
  ComponentName::idSdata,
  allProps_sdata,
  noProps,
  ComponentName::noId,
  ComponentName::idChar,
  ComponentName::noId
};
static const ComponentName::Id allProps_entity[] = {
  INTRINSIC_PROPS,
  ComponentName::idName,
  ComponentName::idEntityType,
  ComponentName::idText,
  ComponentName::idExternalId,
  ComponentName::idAttributes,
  ComponentName::idNotationName,
  ComponentName::idNotation,
  ComponentName::idDefaulted,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_entity[] = {
  ComponentName::idExternalId,
  ComponentName::idAttributes,
  ComponentName::noId
};
const ClassDef ClassDef::entity = {
  ComponentName::idEntity,
  allProps_entity,
  subnodeProps_entity,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
const ClassDef ClassDef::sgmlConstants = {
  ComponentName::idSgmlConstants,
  noProps,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
// FIXME
const ClassDef ClassDef::nonSgml = {
  ComponentName::noId,
  noProps,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
// FIXME
const ClassDef ClassDef::message = {
  ComponentName::noId,
  noProps,
  noProps,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_attributeDef[] = {
  INTRINSIC_PROPS,
  ComponentName::idCurrentAttributeIndex,
  ComponentName::idCurrentGroup,
  ComponentName::idDeclValueType,
  ComponentName::idDefaultValueType,
  ComponentName::idDefaultValue,
  ComponentName::idName,
  ComponentName::idTokens,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_attributeDef[] = {
  ComponentName::idDefaultValue,
  ComponentName::noId
};
const ClassDef ClassDef::attributeDef = {
  ComponentName::idAttributeDef,
  allProps_attributeDef,
  subnodeProps_attributeDef,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_elementType[] = {
  INTRINSIC_PROPS,
  ComponentName::idAttributeDefs,
  ComponentName::idContentType,
  ComponentName::idExclusions,
  ComponentName::idGi,
  ComponentName::idInclusions,
  ComponentName::idModelGroup,
  ComponentName::idOmitEndTag,
  ComponentName::idOmitStartTag,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_elementType[] = {
  ComponentName::idAttributeDefs,
  ComponentName::idModelGroup,
  ComponentName::noId
};
const ClassDef ClassDef::elementType = {
  ComponentName::idElementType,
  allProps_elementType,
  subnodeProps_elementType,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_modelGroup[] = {
  INTRINSIC_PROPS,
  ComponentName::idConnector,
  ComponentName::idOccurenceIndicator,
  ComponentName::idContentTokens,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_modelGroup[] = {
  ComponentName::idContentTokens,
  ComponentName::noId
};
const ClassDef ClassDef::modelGroup = {
  ComponentName::idModelGroup,
  allProps_modelGroup,
  subnodeProps_modelGroup,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_elementToken[] = {
  INTRINSIC_PROPS,
  ComponentName::idGi,
  ComponentName::idOccurenceIndicator,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_elementToken[] = {
  ComponentName::noId
};
const ClassDef ClassDef::elementToken = {
  ComponentName::idElementToken,
  allProps_elementToken,
  subnodeProps_elementToken,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_pcdataToken[] = {
  INTRINSIC_PROPS,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_pcdataToken[] = {
  ComponentName::noId
};
const ClassDef ClassDef::pcdataToken = {
  ComponentName::idPcdataToken,
  allProps_pcdataToken,
  subnodeProps_pcdataToken,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};
static const ComponentName::Id allProps_defaultEntity[] = {
  INTRINSIC_PROPS,
  ComponentName::idName,
  ComponentName::idEntityType,
  ComponentName::idText,
  ComponentName::idExternalId,
  ComponentName::idAttributes,
  ComponentName::idNotationName,
  ComponentName::idNotation,
  ComponentName::noId
};
static const ComponentName::Id subnodeProps_defaultEntity[] = {
  ComponentName::idExternalId,
  ComponentName::idAttributes,
  ComponentName::noId
};
const ClassDef ClassDef::defaultEntity = {
  ComponentName::idDefaultEntity,
  allProps_defaultEntity,
  subnodeProps_defaultEntity,
  ComponentName::noId,
  ComponentName::noId,
  ComponentName::noId
};

#ifdef GROVE_NAMESPACE
}
#endif
