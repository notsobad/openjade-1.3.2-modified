// Copyright (c) 1999 Matthias Clasen
// See the file copying.txt for copying permission.

#ifndef ELObjPropVal_INCLUDED
#define ELObjPropVal_INCLUDED 1

#include "Node.h"
#include "ELObj.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

class ELObjPropertyValue : public PropertyValue {
public:
  ELObjPropertyValue(Interpreter &interp, bool rcs) : interp_(&interp), rcs_(rcs), obj(0) { }
  void set(const NodePtr &nd) {
    obj = new (*interp_) NodePtrNodeListObj(nd);
  }
  void set(const NodeListPtr &nl) {
    obj = new (*interp_) NodeListPtrNodeListObj(nl);
  }
  void set(const NamedNodeListPtr &nnl) {
    obj = new (*interp_) NamedNodeListPtrNodeListObj(nnl);
  }
  void set(bool b) {
    if (b)
      obj = interp_->makeTrue();
    else
      obj = interp_->makeFalse();
  }
 void set(GroveChar c) {
    obj = interp_->makeChar(c);
  }
  void set(GroveString s) {
    obj = new (*interp_) StringObj(s.data(), s.size());
  }
  void set(ComponentName::Id id) {
    const char *s = rcs_ ? ComponentName::rcsName(id) : ComponentName::sdqlName(id);
    obj = interp_->makeSymbol(interp_->makeStringC(s));
  }
  void set(const GroveStringListPtr &gsListPtr) {
    PairObj *head = new (*interp_) PairObj(0, 0);
    ELObjDynamicRoot protect(*interp_, head);
    PairObj *tail = head;
    ConstGroveStringListIter sgListIter(*gsListPtr);
    while (!sgListIter.done()) {
      StringObj *gs = new (*interp_) StringObj(sgListIter.cur().data(), sgListIter.cur().size());
      tail->setCdr(gs);
      PairObj *tem = new (*interp_) PairObj(gs, 0);
      tail->setCdr(tem);
      tail = tem;
      sgListIter.next();
    }
    tail->setCdr(interp_->makeNil());
    obj = head->cdr();
  }
  void set(const ComponentName::Id *names) {
    PairObj *head = new (*interp_) PairObj(0, 0);
    ELObjDynamicRoot protect(*interp_, head);
    PairObj *tail = head;
    for (int i = 0; names[i] != ComponentName::noId; i++) {
      const char *s = (rcs_
                       ? ComponentName::rcsName(names[i])
                       : ComponentName::sdqlName(names[i]));
      SymbolObj *sym = interp_->makeSymbol(interp_->makeStringC(s));
      tail->setCdr(sym); // in case we ever gc symbols
      PairObj *tem = new (*interp_) PairObj(sym, 0);
      tail->setCdr(tem);
      tail = tem;
    }
    tail->setCdr(interp_->makeNil());
    obj = head->cdr();
  }
  void set(long l) {
    obj = interp_->makeInteger(l);
  }
  ELObj *obj;
private:
  Interpreter *interp_;
  bool rcs_;
};

#ifdef DSSSL_NAMESPACE
}
#endif

#endif /* not ELObjPropVal_INCLUDED */


