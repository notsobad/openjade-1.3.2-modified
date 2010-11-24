// Copyright (c) 1996 James Clark
// See the file COPYING for copying permission.

#ifndef Node_INCLUDED
#define Node_INCLUDED 1
#ifdef __GNUG__
#pragma interface
#endif

#include <stddef.h>
#include "IList.h"

#ifdef SP_USE_DLL
#ifdef BUILD_LIBGROVE
#define GROVE_API SP_DLLEXPORT
#else
#define GROVE_API SP_DLLIMPORT
#endif
#else /* not SP_USE_DLL */
#define GROVE_API /* as nothing */
#endif /* not SP_USE_DLL */

#ifdef GROVE_NAMESPACE
#define GROVE_NAMESPACE_SCOPE GROVE_NAMESPACE::
#else
#define GROVE_NAMESPACE_SCOPE
#endif

// Supports the following modules:
// baseabs prlgabs0 prlgabs1 instabs basesds0 instsds0 subdcabs

#ifdef GROVE_NAMESPACE
namespace GROVE_NAMESPACE {
#endif

#ifdef SP_MULTI_BYTE
#ifdef SP_WCHAR_T_USHORT
typedef wchar_t GroveChar;
#else
typedef unsigned int GroveChar;
#endif
#else /* not SP_MULTI_BYTE */
typedef unsigned char GroveChar;
#endif /* not SP_MULTI_BYTE */


class NodePtr;
class NodeListPtr;
class NamedNodeListPtr;
class GroveString;
class NodeVisitor;
class SdataMapper;
class GroveStringList;
class GroveStringListPtr;

enum AccessResult {
  accessOK,			// success
  accessNull,			// value is null
  accessTimeout,                // timed out waiting for property
  accessNotInClass		// property is not defined for class
};

struct GROVE_API ComponentName {
  enum Id {
    noId = -1,
    idAllPropertyNames,
    idAnd,
    idAny,
    idApplicationInfo,
    idAttributeAssignment,
    idAttributeDef,
    idAttributeDefs,
    idAttributes,
    idAttributeValueToken,
    idCdata,
    idChar,
    idChildrenPropertyName,
    idClassName,
    idConnector,
    idConref,
    idContent,
    idContentTokens,
    idContentType,
    idCurrent,
    idCurrentAttributeIndex,
    idCurrentGroup,
    idDataChar,
    idDataPropertyName,
    idDataSepPropertyName,
    idDeclValueType,
    idDefaulted,
    idDefaultedEntities,
    idDefaultEntity,
    idDefaultValue,
    idDefaultValueType,
    idDoctypesAndLinktypes,
    idDocumentElement,
    idDocumentType,
    idElement,
    idElements,
    idElementToken,
    idElementType,
    idElementTypes,
    idEmpty,
    idEntities,
    idEntity,
    idEntityName,
    idEntityType,
    idEpilog,
    idExclusions,
    idExternalData,
    idExternalId,
    idFixed,
    idGeneralEntities,
    idGeneratedSystemId,
    idGi,
    idGoverning,
    idGoverningDoctype,
    idGroveRoot,
    idId,
    idIdref,
    idIdrefs,
    idImplied,
    idIncluded,
    idInclusions,
    idModelGroup,
    idMustOmitEndTag,
    idName,
    idNames,
    idNdata,
    idNmtkgrp,
    idNmtoken,
    idNmtokens,
    idNotation,
    idNotationName,
    idNotations,
    idNumber,
    idNumbers,
    idNutoken,
    idNutokens,
    idOccurenceIndicator,
    idOmitEndTag,
    idOmitStartTag,
    idOpt,
    idOr,
    idOrigin,
    idOriginToSubnodeRelPropertyName,
    idParameterEntities,
    idParent,
    idPcdataToken,
    idPi,
    idPlus,
    idProlog,
    idPublicId,
    idRcdata,
    idReferent,
    idRep,
    idRequired,
    idSdata,
    idSeq,
    idSgmlConstants,
    idSgmlDocument,
    idSubdocument,
    idSubnodePropertyNames,
    idSystemData,
    idSystemId,
    idText,
    idToken,
    idTokens,
    idTokenSep,
    idTreeRoot,
    idValue
  };
  enum { nIds = idValue + 1 };
  static const char *rcsName(Id);
  static const char *sdqlName(Id);
};

struct GROVE_API ClassDef {
  ComponentName::Id className;
  const ComponentName::Id *allPropertyNames;
  const ComponentName::Id *subnodePropertyNames;
  ComponentName::Id childrenPropertyName;
  ComponentName::Id dataPropertyName;
  ComponentName::Id dataSepPropertyName;

  static const ClassDef sgmlDocument;
  static const ClassDef sgmlConstants;
  static const ClassDef dataChar;
  static const ClassDef element;
  static const ClassDef attributeAssignment;
  static const ClassDef attributeDef;
  static const ClassDef attributeValueToken;
  static const ClassDef pi;
  static const ClassDef sdata;
  static const ClassDef documentType;
  static const ClassDef entity;
  static const ClassDef notation;
  static const ClassDef externalId;
  static const ClassDef externalData;
  static const ClassDef subdocument;
  static const ClassDef nonSgml;
  static const ClassDef message;
  static const ClassDef elementType;
  static const ClassDef modelGroup;
  static const ClassDef elementToken;
  static const ClassDef pcdataToken;
  static const ClassDef defaultEntity;
};

class PropertyValue;

class GROVE_API Node {
public:
  // property values
  // data in GroveString valid till Node destroyed
  // default is accessNotInClass
  // Intrinsic properties.
  virtual AccessResult getOrigin(NodePtr &) const;
  virtual AccessResult getParent(NodePtr &) const;
  virtual AccessResult getGroveRoot(NodePtr &) const;
  virtual AccessResult getTreeRoot(NodePtr &) const;
  virtual AccessResult getOriginToSubnodeRelPropertyName(ComponentName::Id &) const = 0;
  AccessResult getClassName(ComponentName::Id &) const;
  AccessResult getChildrenPropertyName(ComponentName::Id &) const;
  AccessResult getDataPropertyName(ComponentName::Id &) const;
  AccessResult getDataSepPropertyName(ComponentName::Id &) const;
  AccessResult getSubnodePropertyNames(const ComponentName::Id *&) const;
  AccessResult getAllPropertyNames(const ComponentName::Id *&) const;

  // this allows you to apply some operation to a node
  // according to its grove class
  virtual void accept(NodeVisitor &) = 0;
  virtual const ClassDef &classDef() const = 0;
  // not formally properties
  virtual AccessResult children(NodeListPtr &) const = 0;
  virtual AccessResult follow(NodeListPtr &) const = 0;
  // return accessNull if there isn't a first or next
  // result accessNotInClass if datatype of otsnr is not node-list or named-node-list
  virtual AccessResult nextSibling(NodePtr &) const;
  // works the same as nextSibling(), except that when charChunk()
  // returns accessOK, returns node following that chunk.
  virtual AccessResult nextChunkSibling(NodePtr &) const;
  // if result == accessOK, length must be > 0
  virtual AccessResult nextChunkAfter(NodePtr &) const;
  virtual AccessResult charChunk(const SdataMapper &, GroveString &) const;
  // return accessNotInClass if class doesn't have children property
  // return accessNull if there isn't a first child
  virtual AccessResult firstChild(NodePtr &) const;
  // First of this node's siblings.
  // accessNotInClass if datatype of otsnr is not node-list or named-node-list
  virtual AccessResult firstSibling(NodePtr &) const;
  // The index of this node in the list of all its siblings.
  virtual AccessResult siblingsIndex(unsigned long &) const;
  // Has a default implementation in terms of getAttributes and NodeList::ref
  virtual AccessResult attributeRef(unsigned long, NodePtr &) const;
  // references the list of the following siblings
  // 0 is the next sibling
  // Has a default implementation in terms of nextSibling.
  virtual AccessResult followSiblingRef(unsigned long, NodePtr &) const;
  // For a tokenized attribute returns tokens separated by spaces;
  // null for a non-tokenized attribute.
  virtual AccessResult tokens(GroveString &) const;

  // For an element, the number of elements started before it,
  // that is its zero-based index in a pre-order traversal of
  // the all the elements in the document.
  virtual AccessResult elementIndex(unsigned long &) const;
  // Node identity.
  // if hash() returns different values for two nodes,
  // the operator==() must return false for those two nodes.
  virtual unsigned long hash() const;
  // Implementation will usually need to call sameGrove().
  virtual bool operator==(const Node &node) const = 0;
  bool operator!=(const Node &node) const { return !(*this == node); }
  // Does this chunk contains nd?
  virtual bool chunkContains(const Node &nd) const;
  bool sameGrove(const Node &node) const;
  typedef const char *IID;
  virtual bool queryInterface(IID, const void *&) const;
  // Property on SGML document giving list of parser messages.
  virtual AccessResult getMessages(NodeListPtr &) const;
  // Property of message.
  enum Severity { info, warning, error };
  virtual AccessResult getSeverity(Severity &) const;
  AccessResult property(ComponentName::Id, const SdataMapper &, PropertyValue &) const;
  virtual unsigned groveIndex() const = 0;
public:
  virtual void addRef() = 0;
  // You must call release rather than use delete.
  // This is done automatically by NodePtr.
  virtual void release() = 0;
protected:
  // This enforces this.
#ifdef __GNUG__
  virtual
#endif
    ~Node() { }
public:
  // This is special.
  // Implemented in terms of charChunk().
  AccessResult getChar(const SdataMapper &, GroveChar &) const;
  // From here on derived algorithmically from property set.
  // Properties common to several node classes.
  virtual AccessResult getAttributes(NamedNodeListPtr &) const;
  virtual AccessResult getName(GroveString &) const;
  virtual AccessResult getSystemData(GroveString &) const;
  virtual AccessResult getEntity(NodePtr &) const;
  virtual AccessResult getEntityName(GroveString &) const;
  virtual AccessResult getExternalId(NodePtr &) const;
  virtual AccessResult getNotation(NodePtr &) const;
  virtual AccessResult getGi(GroveString &) const;
  struct OccurIndicator {
    enum Enum { opt, plus, rep };
  };
  virtual AccessResult getOccurIndicator(OccurIndicator::Enum &) const;
  virtual AccessResult getAttributeDefs(NamedNodeListPtr &) const;
  virtual AccessResult getText(GroveString &) const;
  virtual AccessResult getNotationName(GroveString &) const;
  struct EntityType {
    enum Enum { text, cdata, sdata, ndata, subdocument, pi };
  };
  virtual AccessResult getEntityType(EntityType::Enum &) const;
  // Properties only on entity
  virtual AccessResult getDefaulted(bool &) const;
  // Properties only on externalId
  virtual AccessResult getPublicId(GroveString &) const;
  virtual AccessResult getSystemId(GroveString &) const;
  virtual AccessResult getGeneratedSystemId(GroveString &) const;
  // Properties only on attributeAssignment
  virtual AccessResult getValue(NodeListPtr &) const;
  virtual AccessResult getTokenSep(GroveChar &) const;
  virtual AccessResult getImplied(bool &) const;
  virtual AccessResult getAttributeDef(NodePtr &) const;
  // Properties only on attributeDef
  virtual AccessResult getCurrentAttributeIndex(long &) const;
  virtual AccessResult getCurrentGroup(NodeListPtr &) const;
  struct DeclValueType {
    enum Enum { cdata, entity, entities, id, idref, idrefs, name, names, nmtoken,
                nmtokens, number, numbers, nutoken, nutokens, notation, nmtkgrp };
  };
  virtual AccessResult getDeclValueType(DeclValueType::Enum &) const;
  struct DefaultValueType {
    enum Enum { value, fixed, required, current, conref, implied };
  };
  virtual AccessResult getDefaultValueType(DefaultValueType::Enum &) const;
  virtual AccessResult getDefaultValue(NodeListPtr &) const;
  virtual AccessResult getTokens(GroveStringListPtr &) const;
  // Properties only on element.
  virtual bool hasGi(GroveString) const;
  virtual AccessResult getId(GroveString &) const;
  virtual AccessResult getContent(NodeListPtr &) const;
  virtual AccessResult getIncluded(bool &) const;
  virtual AccessResult getMustOmitEndTag(bool &) const;
  virtual AccessResult getElementType(NodePtr &) const;
  // Properties only on elementType.
  struct ContentType {
    enum Enum { cdata, rcdata, empty, any, modelgrp };
  };
  virtual AccessResult getContentType(ContentType::Enum &) const;
  virtual AccessResult getExclusions(GroveStringListPtr &) const;
  virtual AccessResult getInclusions(GroveStringListPtr &) const;
  virtual AccessResult getModelGroup(NodePtr &) const;
  virtual AccessResult getOmitEndTag(bool &) const;
  virtual AccessResult getOmitStartTag(bool &) const;
  // Properties only on modelGroup.
  struct Connector {
    enum Enum { and_, or_, seq }; // "and", "or" can be keywords
  };
  virtual AccessResult getConnector(Connector::Enum &) const;
  virtual AccessResult getContentTokens(NodeListPtr &) const;
  // Properties only on attributeValueToken.
  virtual AccessResult getToken(GroveString &) const;
  virtual AccessResult getReferent(NodePtr &) const;
  // Properties only on doctype
  virtual AccessResult getGoverning(bool &) const;
  virtual AccessResult getGeneralEntities(NamedNodeListPtr &) const;
  virtual AccessResult getNotations(NamedNodeListPtr &) const;
  virtual AccessResult getElementTypes(NamedNodeListPtr &) const;
  virtual AccessResult getDefaultEntity(NodePtr &) const;
  virtual AccessResult getParameterEntities(NamedNodeListPtr &) const;
  // Properties only on sgmlDocument.
  virtual AccessResult getSgmlConstants(NodePtr &) const;
  virtual AccessResult getApplicationInfo(GroveString &) const;
  virtual AccessResult getProlog(NodeListPtr &) const;
  virtual AccessResult getEpilog(NodeListPtr &) const;
  virtual AccessResult getDocumentElement(NodePtr &) const;
  virtual AccessResult getElements(NamedNodeListPtr &) const;
  virtual AccessResult getEntities(NamedNodeListPtr &) const;
  virtual AccessResult getDefaultedEntities(NamedNodeListPtr &) const;
  virtual AccessResult getGoverningDoctype(NodePtr &) const;
  virtual AccessResult getDoctypesAndLinktypes(NamedNodeListPtr &) const;
  // Properties only on dataChar.
  // For a non-SGML data character (resulting from a numeric character reference).
  // Something like this is being added in the HyTime TC.
  virtual AccessResult getNonSgml(unsigned long &) const;
};

class GROVE_API NodeList {
public:
  virtual AccessResult first(NodePtr &) const = 0;
  virtual AccessResult rest(NodeListPtr &) const = 0;
  virtual AccessResult chunkRest(NodeListPtr &) const = 0;
  // i is a zero based index
  // This has a default implementation in terms of first and rest.
  virtual AccessResult ref(unsigned long i, NodePtr &) const;
  virtual void release() = 0;
  virtual void addRef() = 0;
protected:
#ifdef __GNUG__
  virtual
#endif
    ~NodeList() { }
};

class GROVE_API NamedNodeList {
public:
  // This must NOT assume that the string has been normalized.
  virtual AccessResult namedNode(GroveString, NodePtr &) const = 0;
  // Do name normalize appropriate for this NamedNodeList.
  // Returns new size (always <= old size).
  // This can be used even if list is empty
  virtual size_t normalize(GroveChar *, size_t) const = 0;
  // Could have used subtyping here, but accessing NamedNodeList
  // positionally typically requires different data structure.
  virtual NodeListPtr nodeList() const = 0;
  // Use this when you don't care about the order.
  // May be much more efficient than nodeList().
  virtual NodeListPtr nodeListNoOrder() const;
  enum Type {
    elements,
    attributes,
    entities,
    notations,
    doctypesAndLinktypes,
    elementTypes,
    attributeDefs
  };
  virtual Type type() const = 0;
  // If the node is of a class that occurs in the list,
  // return the value of the property that serves as the name
  // property for nodes of that class in the named node list.
  // Return accessNotInClass if the node is not of a class
  // that occurs in the list.
  AccessResult nodeName(const NodePtr &, GroveString &) const;
  virtual void release() = 0;
  virtual void addRef() = 0;
protected:
#ifdef __GNUG__
  virtual
#endif
    ~NamedNodeList() { }
};

class GROVE_API NodePtr {
public:
  NodePtr() : node_(0) { }
  NodePtr(Node *node) : node_(node) { addRef(); }
  ~NodePtr() { release(); }
  NodePtr(const NodePtr &ptr) : node_(ptr.node_) { addRef(); }
  NodePtr &operator=(const NodePtr &ptr) {
    ptr.addRef();
    release();
    node_ = ptr.node_;
    return *this;
  }
  Node *operator->() const { return node_; }
  Node &operator*() const { return *node_; }
  AccessResult assignOrigin() { return node_->getOrigin(*this); }
  AccessResult assignFirstChild() { return node_->firstChild(*this); }
  AccessResult assignNextSibling() { return node_->nextSibling(*this); }
  AccessResult assignNextChunkSibling() {
    return node_->nextChunkSibling(*this);
  }
  AccessResult assignNextChunkAfter() {
    return node_->nextChunkAfter(*this);
  }
  AccessResult assignFirstSibling() { return node_->firstSibling(*this); }
  void assign(Node *node) {
    if (node)
      node->addRef();
    release();
    node_ = node;
  }
  void clear() { release(); node_ = 0; }
  operator bool() const { return node_ != 0; }
private:
  void addRef() const { if (node_) node_->addRef(); }
  void release() const { if (node_) node_->release(); }
  Node *node_;
};

class GROVE_API NodeListPtr {
public:
  NodeListPtr() : list_(0) { }
  NodeListPtr(NodeList *list) : list_(list) { addRef(); }
  ~NodeListPtr() { release(); }
  NodeListPtr(const NodeListPtr &ptr) : list_(ptr.list_) { addRef(); }
  NodeListPtr &operator=(const NodeListPtr &ptr) {
    ptr.addRef();
    release();
    list_ = ptr.list_;
    return *this;
  }
  AccessResult assignRest() { return list_->rest(*this); }
  AccessResult assignChunkRest() { return list_->chunkRest(*this); }
  NodeList *operator->() const { return list_; }
  NodeList &operator*() const { return *list_; }
  void assign(NodeList *list) {
    if (list)
      list->addRef();
    release();
    list_ = list;
  }
  void clear() { release(); list_ = 0; }
  operator bool() const { return list_ != 0; }
private:
  void addRef() const { if (list_) list_->addRef(); }
  void release() const { if (list_) list_->release(); }
  NodeList *list_;
};

class GROVE_API NamedNodeListPtr {
public:
  NamedNodeListPtr() : list_(0) { }
  NamedNodeListPtr(NamedNodeList *list) : list_(list) { addRef(); }
  ~NamedNodeListPtr() { release(); }
  NamedNodeListPtr(const NamedNodeListPtr &ptr) : list_(ptr.list_) { addRef(); }
  NamedNodeListPtr &operator=(const NamedNodeListPtr &ptr) {
    ptr.addRef();
    release();
    list_ = ptr.list_;
    return *this;
  }
  NamedNodeList *operator->() const { return list_; }
  NamedNodeList &operator*() const { return *list_; }
  void assign(NamedNodeList *list) {
    if (list)
      list->addRef();
    release();
    list_ = list;
  }
  void clear() { release(); list_ = 0; }
  operator bool() const { return list_ != 0; }
private:
  void addRef() const { if (list_) list_->addRef(); }
  void release() const { if (list_) list_->release(); }
  NamedNodeList *list_;
};

class GROVE_API GroveString {
public:
  typedef const GroveChar *const_iterator;
  GroveString() : data_(0), size_(0) { }
  GroveString(const GroveChar *data, size_t size)
    : data_(data), size_(size) { }
  size_t size() const { return size_; }
  const GroveChar *data() const { return data_; }
  void assign(const GroveChar *data, size_t size) {
    data_ = data;
    size_ = size;
  }
  bool operator==(const GroveString &str) const;
  bool operator!=(const GroveString &str) const { return !(*this == str); }
  GroveChar operator[](size_t i) const { return data_[i]; }
  const_iterator begin() const { return data_; }
  const_iterator end() const { return data_ + size_; }
private:
  const GroveChar *data_;
  size_t size_;
};

class GROVE_API GroveStringLink {
public:
  GroveStringLink( const GroveString &gs )
   : data_(gs), next_(0) { }
  friend class GroveStringList;
  friend class ConstGroveStringListIter;
private:
  GroveString data_;
  GroveStringLink *next_;
};

class GroveStringList;

class GROVE_API ConstGroveStringListIter {
public:
  friend class GroveStringList;
  ConstGroveStringListIter() : link_(0) { }
  ConstGroveStringListIter(const GroveStringList &list);
  int done() const { return link_ == 0; }
  const GroveString &cur() const { return link_->data_; }
  void next() { link_ = link_->next_; }
protected:
  void attach(const GroveStringLink *link) { link_ = link; }
  const GroveStringLink *link_;
};

class GROVE_API GroveStringList {
public:
  friend class ConstGroveStringListIter;
  GroveStringList() : head_(0), refCount_(0) { }
  ~GroveStringList();
  void append(const GroveString &gs);
  void release();
  void addRef();
  bool canReuse(GroveStringListPtr &ptr) const;
  AccessResult first(GroveString &) const;
  AccessResult rest(GroveStringListPtr &) const;
  const ConstGroveStringListIter &iter() { return iter_; }
private:
  unsigned refCount_;
  GroveStringLink *head_;
  ConstGroveStringListIter iter_;
};

class GROVE_API GroveStringListPtr {
public:
  GroveStringListPtr() : list_(0) { }
  GroveStringListPtr(GroveStringList *list) : list_(list) { addRef(); }
  ~GroveStringListPtr() { release(); }
  GroveStringListPtr(const GroveStringListPtr &ptr) : list_(ptr.list_) { addRef(); }
  GroveStringListPtr &operator=(const GroveStringListPtr &ptr) {
    ptr.addRef();
    release();
    list_ = ptr.list_;
    return *this;
  }
  GroveStringList *operator->() const { return list_; }
  GroveStringList &operator*() const { return *list_; }
  void assign(GroveStringList *list) {
    if (list)
      list->addRef();
    release();
    list_ = list;
  }
  void clear() { release(); list_ = 0; }
  operator bool() const { return list_ != 0; }
private:
  void addRef() const { if (list_) list_->addRef(); }
  void release() const { if (list_) list_->release(); }
  GroveStringList *list_;
};

class GROVE_API SdataMapper {
public:
  virtual ~SdataMapper();
  // Returns a pointer to a single character or null
  virtual bool sdataMap(GroveString name, GroveString text, GroveChar &) const;
};

// See Design Patterns.

class GROVE_API NodeVisitor {
public:
  virtual void sgmlDocument(Node &);
  virtual void sgmlConstants(Node &);
  virtual void dataChar(Node &);
  virtual void element(Node &);
  virtual void attributeAssignment(Node &);
  virtual void attributeDef(Node &);
  virtual void attributeValueToken(Node &);
  virtual void pi(Node &);
  virtual void sdata(Node &);
  virtual void documentType(Node &);
  virtual void entity(Node &);
  virtual void notation(Node &);
  virtual void externalId(Node &);
  virtual void externalData(Node &);
  virtual void subdocument(Node &);
  virtual void nonSgml(Node &);
  virtual void message(Node &);
  virtual void elementType(Node &);
  virtual void modelGroup(Node &);
  virtual void elementToken(Node &);
  virtual void pcdataToken(Node &);
  virtual void defaultEntity(Node &);
};

class GROVE_API PropertyValue {
public:
  virtual ~PropertyValue() { }
  virtual void set(const NodePtr &) = 0;
  virtual void set(const NodeListPtr &) = 0;
  virtual void set(const NamedNodeListPtr &) = 0;
  virtual void set(bool) = 0;
  virtual void set(GroveChar) = 0;
  virtual void set(GroveString) = 0;
  virtual void set(ComponentName::Id) = 0;
  virtual void set(const GroveStringListPtr &) = 0;
  virtual void set(const ComponentName::Id *) = 0;
  virtual void set(long) = 0;
};

inline
AccessResult Node::getChar(const SdataMapper &mapper, GroveChar &c) const
{
  GroveString str;
  AccessResult ret = charChunk(mapper, str);
  if (ret == accessOK)
    c = str[0];
  return ret;
}

inline
bool Node::sameGrove(const Node &node) const
{
  return groveIndex() == node.groveIndex();
}

inline
AccessResult Node::getClassName(ComponentName::Id &name) const
{
  name = classDef().className;
  return accessOK;
}

inline
AccessResult Node::getChildrenPropertyName(ComponentName::Id &name) const
{
  const ClassDef &def = classDef();
  if (def.childrenPropertyName == ComponentName::noId)
    return accessNull;
  name = def.childrenPropertyName;
  return accessOK;
}

inline
AccessResult Node::getDataPropertyName(ComponentName::Id &name) const
{
  const ClassDef &def = classDef();
  if (def.dataPropertyName == ComponentName::noId)
    return accessNull;
  name = def.dataPropertyName;
  return accessOK;
}

inline
AccessResult Node::getDataSepPropertyName(ComponentName::Id &name) const
{
  const ClassDef &def = classDef();
  if (def.dataSepPropertyName == ComponentName::noId)
    return accessNull;
  name = def.dataSepPropertyName;
  return accessOK;
}

inline
AccessResult Node::getSubnodePropertyNames(const ComponentName::Id *&names) const
{
  names = classDef().subnodePropertyNames;
  return accessOK;
}

inline
AccessResult Node::getAllPropertyNames(const ComponentName::Id *&names) const
{
   names = classDef().allPropertyNames;
   return accessOK;
}

#ifdef GROVE_NAMESPACE
}
#endif

#endif /* not Node_INCLUDED */
