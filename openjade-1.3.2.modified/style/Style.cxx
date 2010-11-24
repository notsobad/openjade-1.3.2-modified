// Copyright (c) 1996 James Clark
// See the file copying.txt for copying permission.

#include "stylelib.h"
#include "Style.h"
#include "VM.h"
#include "Interpreter.h"
#include "InterpreterMessages.h"
#include "SosofoObj.h"
#include "macros.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

StyleStack::StyleStack()
: level_(0)
{
}

void StyleStack::pushContinue(StyleObj *style,
			      const ProcessingMode::Rule *rule,
			      const NodePtr &nodePtr,
			      Messenger *mgr)
{
  StyleObjIter iter;
  style->appendIter(iter);
  for (;;) {
    const VarStyleObj *varStyle;
    ConstPtr<InheritedC> spec(iter.next(varStyle));
    if (spec.isNull())
      break;
    size_t ind = spec->index();
    if (ind >= inheritedCInfo_.size())
      inheritedCInfo_.resize(ind + 1);
    Ptr<InheritedCInfo> &info = inheritedCInfo_[ind];
    if (!info.isNull() && info->valLevel == level_) {
      if (rule) {
	ASSERT(info->rule != 0);
	if (rule->compareSpecificity(*info->rule) == 0) {
	  mgr->setNextLocation(info->rule->location());
	  mgr->message(InterpreterMessages::ambiguousStyle,
	               StringMessageArg(info->spec->identifier()->name()),
		       rule->location());
	}
      }

    }
    else {
      popList_->list.push_back(ind);
      info = new InheritedCInfo(spec, varStyle, level_, level_, rule, info);
    }
  }
}

void StyleStack::pushEnd(VM &vm, FOTBuilder &fotb)
{
  const PopList *oldPopList = popList_->prev.pointer();
  if (oldPopList) {
    for (size_t i = 0; i < oldPopList->dependingList.size(); i++) {
      size_t d = oldPopList->dependingList[i];
      // d is the index of a characteristic that depends on the actual
      // value of another characteritistic
      if (inheritedCInfo_[d]->valLevel != level_) {
	const Vector<size_t> &dependencies = inheritedCInfo_[d]->dependencies;
	bool changed = 0;
	for (size_t j = 0; j < dependencies.size(); j++) {
	  const InheritedCInfo *p = inheritedCInfo_[dependencies[j]].pointer();
	  if (p && p->valLevel == level_) {
	    inheritedCInfo_[d] = new InheritedCInfo(inheritedCInfo_[d]->spec,
						    inheritedCInfo_[d]->style,
						    level_,
						    inheritedCInfo_[d]->specLevel,
						    inheritedCInfo_[d]->rule,
	                                            inheritedCInfo_[d]);
	    popList_->list.push_back(d);
	    changed = 1;
	    break;
	  }
	}
	// If it changed, then doing set() on the new value will add
	// it to the dependingList for this level.
	if (!changed)
	  popList_->dependingList.push_back(d);
      }
    }
  }
  vm.styleStack = this;
  for (size_t i = 0; i < popList_->list.size(); i++) {
    InheritedCInfo &info = *inheritedCInfo_[popList_->list[i]];
    vm.specLevel = info.specLevel;
    info.spec->set(vm, info.style, fotb, info.cachedValue, info.dependencies);
    if (info.dependencies.size())
      popList_->dependingList.push_back(popList_->list[i]);
  }
  vm.styleStack = 0;
}

void StyleStack::pop()
{
  for (size_t i = 0; i < popList_->list.size(); i++) {
    size_t ind = popList_->list[i];
    ASSERT(inheritedCInfo_[ind]->valLevel == level_);
    Ptr<InheritedCInfo> tem(inheritedCInfo_[ind]->prev);
    inheritedCInfo_[ind] = tem;
  }
  level_--;
  Ptr<PopList> tem(popList_->prev);
  popList_ = tem;
}

ELObj *StyleStack::inherited(const ConstPtr<InheritedC> &ic, unsigned specLevel,
			     Interpreter &interp, Vector<size_t> &dependencies)
{
  ASSERT(specLevel != unsigned(-1));
  size_t ind = ic->index();
  ConstPtr<InheritedC> spec;
  const VarStyleObj *style = 0;
  unsigned newSpecLevel = unsigned(-1);
  if (ind >= inheritedCInfo_.size())
    spec = ic;
  else {
    const InheritedCInfo *p = inheritedCInfo_[ind].pointer();
    while (p != 0) {
      if (p->specLevel < specLevel)
	break;
      p = p->prev.pointer();
    }
    if (!p)
      spec = ic;
    else {
      if (p->cachedValue) {
	// We can only use the cached value if none of the values
	// we depended on changed since we computed it.
	bool cacheOk = 1;
	for (size_t i = 0; i < p->dependencies.size(); i++) {
	  size_t d = p->dependencies[i];
	  if (d < inheritedCInfo_.size()
	      && inheritedCInfo_[d]->valLevel > p->valLevel) {
	    cacheOk = 0;
	    break;
	  }
	}
	if (cacheOk)
	  return p->cachedValue;
      }
      style = p->style;
      spec = p->spec;
      newSpecLevel = p->specLevel;
    }
  }
  VM vm(interp);
  vm.styleStack = this;
  vm.specLevel = newSpecLevel;
  return spec->value(vm, style, dependencies);
}

ELObj *StyleStack::actual(const ConstPtr<InheritedC> &ic, const Location &loc,
			  Interpreter &interp, Vector<size_t> &dependencies)
{
  size_t ind = ic->index();
  for (size_t i = 0; i < dependencies.size(); i++) {
    if (dependencies[i] == ind) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::actualLoop,
		     StringMessageArg(ic->identifier()->name()));
      return interp.makeError();
    }
  }
  dependencies.push_back(ind);
  ConstPtr<InheritedC> spec;
  const VarStyleObj *style = 0;
  if (ind >= inheritedCInfo_.size())
    spec = ic;
  else {
    const InheritedCInfo *p = inheritedCInfo_[ind].pointer();
    if (!p)
      spec = ic;
    else if (p->cachedValue) {
      const Vector<size_t> &dep = p->dependencies;
      for (size_t i = 0; i < dep.size(); i++)
	dependencies.push_back(dep[i]);
      return p->cachedValue;
    }
    else {
      style = p->style;
      spec = p->spec;
    }
  }
  VM vm(interp);
  vm.styleStack = this;
  vm.specLevel = level_;
  return spec->value(vm, style, dependencies);
}

void StyleStack::trace(Collector &c) const
{
  for (size_t i = 0; i < inheritedCInfo_.size(); i++) {
    for (const InheritedCInfo *p = inheritedCInfo_[i].pointer();
         p;
	 p = p->prev.pointer()) {
      c.trace(p->style);
      c.trace(p->cachedValue);
    }
  }
}

InheritedCInfo::InheritedCInfo(const ConstPtr<InheritedC> &sp,
			       const VarStyleObj *so,
			       unsigned vl,
			       unsigned sl,
			       const ProcessingMode::Rule *r,
			       const Ptr<InheritedCInfo> &p)
: spec(sp), style(so), valLevel(vl), specLevel(sl), rule(r), prev(p), cachedValue(0)
{
}

StyleObj *StyleObj::asStyle()
{
  return this;
}

VarStyleObj::VarStyleObj(const ConstPtr<StyleSpec> &styleSpec, StyleObj *use, ELObj **display,
			 const NodePtr &node)
: styleSpec_(styleSpec), use_(use), display_(display), node_(node)
{
  hasSubObjects_ = 1;
}

VarStyleObj::~VarStyleObj()
{
  delete [] display_;
}

void VarStyleObj::traceSubObjects(Collector &c) const
{
  c.trace(use_);
  if (display_)
    for (ELObj **pp = display_; *pp; pp++)
      c.trace(*pp);
}

void VarStyleObj::appendIterForce(StyleObjIter &iter) const
{
  if (styleSpec_->forceSpecs.size())
    iter.append(&styleSpec_->forceSpecs, this);
}

void VarStyleObj::appendIterNormal(StyleObjIter &iter) const
{
  if (styleSpec_->specs.size())
    iter.append(&styleSpec_->specs, this);
  if (use_)
    use_->appendIter(iter);
}

void VarStyleObj::appendIter(StyleObjIter &iter) const
{
  VarStyleObj::appendIterForce(iter);
  VarStyleObj::appendIterNormal(iter);
}

OverriddenStyleObj::OverriddenStyleObj(BasicStyleObj *basic, StyleObj *override)
: basic_(basic), override_(override)
{
  hasSubObjects_ = 1;
}

void OverriddenStyleObj::traceSubObjects(Collector &c) const
{
  c.trace(basic_);
  c.trace(override_);
}

void OverriddenStyleObj::appendIter(StyleObjIter &iter) const
{
  basic_->appendIterForce(iter);
  override_->appendIter(iter);
  basic_->appendIterNormal(iter);
}

MergeStyleObj::MergeStyleObj()
{
  hasSubObjects_ = 1;
}

void MergeStyleObj::append(StyleObj *obj)
{
  styles_.push_back(obj);
}

void MergeStyleObj::appendIter(StyleObjIter &iter) const
{
  for (size_t i = 0; i < styles_.size(); i++)
    styles_[i]->appendIter(iter);
}

void MergeStyleObj::traceSubObjects(Collector &c) const
{
  for (size_t i = 0; i < styles_.size(); i++)
    c.trace(styles_[i]);
}

ColorObj *ColorObj::asColor()
{
  return this;
}

DeviceRGBColorObj::DeviceRGBColorObj(unsigned char red, unsigned char green,
				     unsigned char blue)
{
  color_.red = red;
  color_.green = green;
  color_.blue = blue;
}

void DeviceRGBColorObj::set(FOTBuilder &fotb) const
{
  fotb.setColor(color_);
}

void DeviceRGBColorObj::setBackground(FOTBuilder &fotb) const
{
  fotb.setBackgroundColor(color_);
}

ColorSpaceObj *ColorSpaceObj::asColorSpace()
{
  return this;
}

// invert a 3x3 matrix A. result is returned in B
// both must be arrays of length 9.
static void
invert(double *A, double *B)
{
  B[0] =   (A[4]*A[8] - A[5]*A[7]); 
  B[3] = - (A[3]*A[8] - A[5]*A[6]);
  B[6] =   (A[3]*A[7] - A[4]*A[6]);
  B[1] = - (A[1]*A[8] - A[2]*A[7]);
  B[4] =   (A[0]*A[8] - A[2]*A[6]);
  B[7] = - (A[0]*A[7] - A[1]*A[6]);
  B[2] =   (A[1]*A[5] - A[2]*A[4]);
  B[5] = - (A[0]*A[5] - A[2]*A[3]);
  B[8] =   (A[0]*A[4] - A[1]*A[3]);
  double det = A[0]*B[0] + A[1]*B[3] + A[2]*B[6]; 
  if (det < 0.0001) {
    //FIXME message
  }
  B[0] /= det; B[1] /= det; B[2] /= det;           
  B[3] /= det; B[4] /= det; B[5] /= det;          
  B[6] /= det; B[7] /= det; B[8] /= det;         
}

/*
 FIXME make color handling more flexible:
  * pass different color types to backends
  * move the conversion code to a separate
    class ColorConverter, which could then
    be used by backends to do the needed
    conversions. 
  * make phosphors settable 
  * make highlight color for KX settable 
  * whitepoint correction, making the device 
    whitepoint/blackpoint settable

 for the formulas used here, see:
  * Computer Graphics, Principles and Practice, Second Edition,
    Foley, van Damme, Hughes,
    Addison-Wesley, 1987
  * Principles of Color Technology, Second Edition, 
    Fred W. Billmeyer, Jr. and Max Saltzman, 
    John Wiley & Sons, Inc., 1981
  * The color faq
*/
CIEXYZColorSpaceObj::CIEXYZColorSpaceObj(const double *wp, const double *bp)
{
  xyzData_ = new XYZData;
  for (int i = 0; i < 3; i++) 
    xyzData_->white_[i] = wp[i];
  double tmp = wp[0] + 15*wp[1] + 3*wp[2]; 
  xyzData_->white_u = 4*wp[0]/tmp;
  xyzData_->white_v = 9*wp[1]/tmp;

  // from the color faq
  double xr = .64; double yr = .33; 
  double xg = .30; double yg = .60;
  double xb = .15; double yb = .06;
  double U[9];
  U[0] = xr; U[1] = xg; U[2] = xb; 
  U[3] = yr; U[4] = yg; U[5] = yb; 
  U[6] = 1.0 - xr - yr; U[7] = 1.0 - xg - yg; U[8] = 1.0 - xb - yb; 
  double Uinv[9];
  invert(U, Uinv);  
  double C[3];
  for (int i = 0; i < 3; i++) 
    C[i] = Uinv[3*i]*wp[0] + Uinv[3*i+1]*wp[1] + Uinv[3*i+2]*wp[2];
  double Minv[9];
  Minv[0] = U[0]*C[0]; Minv[1] = U[1]*C[1]; Minv[2] = U[2]*C[2];
  Minv[3] = U[3]*C[0]; Minv[4] = U[4]*C[1]; Minv[5] = U[5]*C[2];
  Minv[6] = U[6]*C[0]; Minv[7] = U[7]*C[1]; Minv[8] = U[8]*C[2];
  invert(Minv, xyzData_->M_);
}

CIEXYZColorSpaceObj::~CIEXYZColorSpaceObj()
{
  delete xyzData_;
}

ELObj *CIEXYZColorSpaceObj::makeColor (const double *h, Interpreter &interp)
{
 unsigned char c[3];
 for (int i = 0; i < 3; i++) 
   c[i] = (unsigned char) ((xyzData_->M_[3*i]*h[0] 
                          + xyzData_->M_[3*i+1]*h[1] 
                          + xyzData_->M_[3*i+2]*h[2])*255.0 + .5);

  return new (interp) DeviceRGBColorObj(c[0], c[1], c[2]);
}

CIELUVColorSpaceObj::CIELUVColorSpaceObj(const double *wp, const double *bp, const double *r) 
: CIEXYZColorSpaceObj(wp, bp)
{
  luvData_ = new LUVData;
  for (int i = 0; i < 6; i++) 
    luvData_->range_[i] = r ? r[i] : ((i % 2) ? 1.0 : .0);
}
                                         
CIELUVColorSpaceObj::~CIELUVColorSpaceObj()
{
  delete luvData_;
}

ELObj *CIELUVColorSpaceObj::makeColor(int argc, ELObj **argv,
				 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 3) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("CIE LUV")));
    return interp.makeError();
  }
  double d[3];
  for (int i = 0; i < 3; i++) {
    if (!argv[i]->realValue(d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("CIE LUV")));
      return interp.makeError();
    }
    if (d[i] < luvData_->range_[2*i] || d[i] > luvData_->range_[2*i+1]) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("CIE LUV")));
      return interp.makeError();
    }
  }

  double h[3];
  if (d[0] == 0.0) {
    h[0] = h[1] = h[2] = 0.0;
  } else {                                   
    if (d[0] <= 7.996968)
      h[1] = d[0] / 903.0;
    else { 
      h[1] = (d[0] + 16.0) / 116.0;
      h[1] = h[1] * h[1] * h[1];
    }                                        
    double uu = d[1] / (13.0 * d[0]) + xyzData_->white_u;
    double vv = d[2] / (13.0 * d[0]) + xyzData_->white_v;    
    double tmp = 9.0 * h[1] / vv;                 
    h[0] = uu * tmp / 4.0;                  
    h[2] = (tmp - 15.0 * h[1] - h[0]) / 3.0;     
  }              

  return CIEXYZColorSpaceObj::makeColor(h, interp);
}

CIELABColorSpaceObj::CIELABColorSpaceObj(const double *wp, const double *bp, const double *r) 
: CIEXYZColorSpaceObj(wp, bp)
{
  labData_ = new LABData;
  if (r)
    for (int i = 0; i < 6; i++) 
      labData_->range_[i] = r[i];
  else { 
    labData_->range_[0] = .0;
    labData_->range_[1] = 100.0;
    labData_->range_[2] = .0;
    labData_->range_[3] = 1.0;
    labData_->range_[4] = .0;
    labData_->range_[5] = 1.0;
  }  
}
                                         
CIELABColorSpaceObj::~CIELABColorSpaceObj()
{
  delete labData_;
}

ELObj *CIELABColorSpaceObj::makeColor(int argc, ELObj **argv,
				 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 3) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("CIE LAB")));
    return interp.makeError();
  }
  double d[3];
  for (int i = 0; i < 3; i++) {
    if (!argv[i]->realValue(d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("CIE LAB")));
      return interp.makeError();
    }
    if (d[i] < labData_->range_[2*i] || d[i] > labData_->range_[2*i+1]) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("CIE LAB")));
      return interp.makeError();
    }
  }
  d[0] /= 100.0;
  
  double h[3];
  double tmp = (d[0] + 16.0) / 116.0;
  h[1] = tmp * tmp * tmp;
  if (h[1] < 0.008856) {
    tmp = d[0] / 9.03292;
    h[0] = xyzData_->white_[0] * ((d[1] / 3893.5) + tmp);
    h[1] = tmp;
    h[2] = xyzData_->white_[2] * (tmp - (d[2] / 1557.4));
  } else {
    double tmp2 = tmp + (d[1] / 5.0);
    h[0] = xyzData_->white_[0] * tmp2 * tmp2 * tmp2;
    tmp2 = tmp - (d[2] / 2.0);
    h[2] = xyzData_->white_[2] * tmp2 * tmp2 * tmp2;
  }

  return CIEXYZColorSpaceObj::makeColor(h, interp);
}

CIEABCColorSpaceObj::CIEABCColorSpaceObj(const double *wp, const double *bp, 
      const double *rabc, FunctionObj **dabc, const double *mabc, 
      const double *rlmn, FunctionObj **dlmn, const double *mlmn) 
: CIEXYZColorSpaceObj(wp, bp)
{
  abcData_ = new ABCData;
  int i;
  for (i = 0; i < 6; i++) 
    abcData_->rangeAbc_[i] = rabc ? rabc[i] : ((i % 2) ? 1.0 : 0.0); 
  for (i = 0; i < 3; i++)
    abcData_->decodeAbc_[i] = dabc ? dabc[i] : 0;
  for (i = 0; i < 9; i++)
    abcData_->matrixAbc_[i] = mabc ? mabc[i] : ((i % 4) ? 0.0 : 1.0);
  for (i = 0; i < 6; i++) 
    abcData_->rangeLmn_[i] = rlmn ? rlmn[i] : ((i % 2) ? 1.0 : 0.0); 
  for (i = 0; i < 3; i++)
    abcData_->decodeLmn_[i] = dlmn ? dlmn[i] : 0;
  for (i = 0; i < 9; i++)
    abcData_->matrixLmn_[i] = mlmn ? mlmn[i] : ((i % 4) ? 0.0 : 1.0);
}

CIEABCColorSpaceObj::~CIEABCColorSpaceObj()
{
  delete abcData_;
}

void CIEABCColorSpaceObj::traceSubObjects(Collector &c) const
{ 
  for (int i = 0; i < 3; i++)  
    if (abcData_->decodeAbc_[i])
      c.trace(abcData_->decodeAbc_[i]);
  for (int i = 0; i < 3; i++)  
    if (abcData_->decodeLmn_[i])
      c.trace(abcData_->decodeLmn_[i]);
  
}

static 
bool applyFunc(Interpreter &interp, FunctionObj *f, double &d)
{
  InsnPtr insns[2];
  insns[1] = f->makeCallInsn(1, interp, Location(), InsnPtr());
  insns[0] = InsnPtr(new ConstantInsn(new (interp) RealObj(d),insns[1]));
  VM vm(interp);
  ELObj *res = vm.eval(insns[0].pointer());
  if (!res || !res->realValue(d)) 
    return 0;
  return 1;
}

ELObj *CIEABCColorSpaceObj::makeColor(int argc, ELObj **argv,
				 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 3) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("CIE Based ABC")));
    return interp.makeError();
  }
  double d[3];
  for (int i = 0; i < 3; i++) {
    if (!argv[i]->realValue(d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("CIE Based ABC")));
      return interp.makeError();
    }
    if (d[i] < abcData_->rangeAbc_[2*i] || d[i] > abcData_->rangeAbc_[2*i+1]) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("CIE Based ABC")));
      return interp.makeError();
    }
    if (abcData_->decodeAbc_[i] && !applyFunc(interp, abcData_->decodeAbc_[i], d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorProcResType,
                     StringMessageArg(interp.makeStringC("CIE Based ABC")));
      return interp.makeError();
    }
  }
  double l[3];
  for (int i = 0; i < 3; i++) { 
    l[i] = abcData_->matrixAbc_[i]*d[0] 
         + abcData_->matrixAbc_[3+i]*d[1] 
         + abcData_->matrixAbc_[6+i]*d[2];
    if (l[i] < abcData_->rangeLmn_[2*i] || l[i] > abcData_->rangeLmn_[2*i+1]) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("CIE Based ABC")));
      return interp.makeError();
    }
    if (abcData_->decodeLmn_[i] && !applyFunc(interp, abcData_->decodeLmn_[i], l[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorProcResType,
                     StringMessageArg(interp.makeStringC("CIE Based ABC")));
      return interp.makeError();
    }
  }
  double h[3];
  for (int i = 0; i < 3; i++)  
    h[i] = abcData_->matrixLmn_[i]*l[0] 
         + abcData_->matrixLmn_[3+i]*l[1] 
         + abcData_->matrixLmn_[6+i]*l[2];

  return CIEXYZColorSpaceObj::makeColor(h, interp);
}

CIEAColorSpaceObj::CIEAColorSpaceObj(const double *wp, const double *bp, 
      const double *ra, FunctionObj *da, const double *ma, 
      const double *rlmn, FunctionObj **dlmn, const double *mlmn) 
: CIEXYZColorSpaceObj(wp, bp)
{
  aData_ = new AData;
  int i;
  for (i = 0; i < 2; i++) 
    aData_->rangeA_[i] = ra ? ra[i] : ((i % 2) ? 1.0 : 0.0); 
  aData_->decodeA_ = da ? da : 0;
  for (i = 0; i < 3; i++)
    aData_->matrixA_[i] = ma ? ma[i] : 1.0;
  for (i = 0; i < 6; i++) 
    aData_->rangeLmn_[i] = rlmn ? rlmn[i] : ((i % 2) ? 1.0 : 0.0); 
  for (i = 0; i < 3; i++)
    aData_->decodeLmn_[i] = dlmn ? dlmn[i] : 0;
  for (i = 0; i < 9; i++)
    aData_->matrixLmn_[i] = mlmn ? mlmn[i] : ((i % 4) ? 0.0 : 1.0);
}

CIEAColorSpaceObj::~CIEAColorSpaceObj()
{
  delete aData_;
}

void CIEAColorSpaceObj::traceSubObjects(Collector &c) const
{ 
  if (aData_->decodeA_)
    c.trace(aData_->decodeA_);
  for (int i = 0; i < 3; i++)  
    if (aData_->decodeLmn_[i])
      c.trace(aData_->decodeLmn_[i]);
}

ELObj *CIEAColorSpaceObj::makeColor(int argc, ELObj **argv,
				 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 1) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("CIE Based A")));
    return interp.makeError();
  }
  double d;
  if (!argv[0]->realValue(d)) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgType,
                   StringMessageArg(interp.makeStringC("CIE Based A")));
    return interp.makeError();
  }
  if (d < aData_->rangeA_[0] || d > aData_->rangeA_[1]) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgRange,
                   StringMessageArg(interp.makeStringC("CIE Based A")));
    return interp.makeError();
  }
  if (aData_->decodeA_ && !applyFunc(interp, aData_->decodeA_, d)) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorProcResType,
                   StringMessageArg(interp.makeStringC("CIE Based A")));
    return interp.makeError();
  }
  double l[3];
  for (int i = 0; i < 3; i++) { 
    l[i] = aData_->matrixA_[i]*d;  
    if (l[i] < aData_->rangeLmn_[2*i] || l[i] > aData_->rangeLmn_[2*i+1]) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("CIE Based A")));
      return interp.makeError();
    }
    if (aData_->decodeLmn_[i] && !applyFunc(interp, aData_->decodeLmn_[i], l[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorProcResType,
                     StringMessageArg(interp.makeStringC("CIE Based A")));
      return interp.makeError();
    }
  }
  double h[3];
  for (int i = 0; i < 3; i++) { 
    h[i] = aData_->matrixLmn_[i]*l[0] 
         + aData_->matrixLmn_[3+i]*l[1] 
         + aData_->matrixLmn_[6+i]*l[2];
  }
  return CIEXYZColorSpaceObj::makeColor(h, interp);
}

ELObj *DeviceRGBColorSpaceObj::makeColor(int argc, ELObj **argv,
					 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 3) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("Device RGB")));
    return interp.makeError();
  }
  unsigned char c[3];
  for (int i = 0; i < 3; i++) {
    double d;
    if (!argv[i]->realValue(d)) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("Device RGB")));
      return interp.makeError();
    }
    if (d < 0.0 || d > 1.0) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("Device RGB")));
      return interp.makeError();
    }
    c[i] = (unsigned char)(d*255.0 + .5);
  }
  return new (interp) DeviceRGBColorObj(c[0], c[1], c[2]);
}

ELObj *DeviceGrayColorSpaceObj::makeColor(int argc, ELObj **argv,
					 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 1) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("Device Gray")));
    return interp.makeError();
  }
  unsigned char c;
  double d;
  if (!argv[0]->realValue(d)) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgType,
                   StringMessageArg(interp.makeStringC("Device Gray")));
    return interp.makeError();
  }
  if (d < 0.0 || d > 1.0) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgRange,
                   StringMessageArg(interp.makeStringC("Device Gray")));
    return interp.makeError();
  }
  c = (unsigned char)(d*255.0 + .5);
  return new (interp) DeviceRGBColorObj(c, c, c);
}

#define MIN(x,y) (((x) < (y)) ? (x) : (y)) 

ELObj *DeviceCMYKColorSpaceObj::makeColor(int argc, ELObj **argv,
					 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 4) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("Device CMYK")));
    return interp.makeError();
  }
  double d[4];
  for (int i = 0; i < 4; i++) {
    if (!argv[i]->realValue(d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("Device CMYK")));
      return interp.makeError();
    }
    if (d[i] < 0.0 || d[i] > 1.0) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("Device CMYK")));
      return interp.makeError();
    }
  }
  unsigned char c[3];
  for (int i = 0; i < 3; i++) 
    c[i] = (unsigned char)((1 - MIN(1, d[i] + d[3]))*255.0 + .5);
  return new (interp) DeviceRGBColorObj(c[0], c[1], c[2]);
}

ELObj *DeviceKXColorSpaceObj::makeColor(int argc, ELObj **argv,
					 Interpreter &interp, const Location &loc)
{
  if (argc == 0)
    return new (interp) DeviceRGBColorObj(0, 0, 0);
  if (argc != 2) {
    interp.setNextLocation(loc);
    interp.message(InterpreterMessages::colorArgCount,
                   StringMessageArg(interp.makeStringC("Device KX")));
    return interp.makeError();
  }
  double d[2];
  for (int i = 0; i < 2; i++) {
    if (!argv[i]->realValue(d[i])) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgType,
                     StringMessageArg(interp.makeStringC("Device KX")));
      return interp.makeError();
    }
    if (d[i] < 0.0 || d[i] > 1.0) {
      interp.setNextLocation(loc);
      interp.message(InterpreterMessages::colorArgRange,
                     StringMessageArg(interp.makeStringC("Device KX")));
      return interp.makeError();
    }
  }
  unsigned char c;
  c = (unsigned char)((1 - MIN(1, d[0] + d[1]))*255.0 + .5);
  return new (interp) DeviceRGBColorObj(c, c, c);
}

VarInheritedC::VarInheritedC(const ConstPtr<InheritedC> &ic,
			     const InsnPtr &code, const Location &loc)
: InheritedC(ic->identifier(), ic->index()), inheritedC_(ic), code_(code), loc_(loc)
{
}

void VarInheritedC::set(VM &vm, const VarStyleObj *style, FOTBuilder &fotb,
			ELObj *&cacheObj, Vector<size_t> &dependencies) const
{
  if (!cacheObj) {
    EvalContext::CurrentNodeSetter cns(style->node(), 0, vm);
    vm.actualDependencies = &dependencies;
    cacheObj = vm.eval(code_.pointer(), style->display());
    ASSERT(cacheObj != 0);
    vm.actualDependencies = 0;
  }
  if (!vm.interp->isError(cacheObj)) {
    ConstPtr<InheritedC> c(inheritedC_->make(cacheObj, loc_, *vm.interp));
    if (!c.isNull())
      c->set(vm, 0, fotb, cacheObj, dependencies);
  }
}

ConstPtr<InheritedC> VarInheritedC::make(ELObj *obj, const Location &loc, Interpreter &interp)
     const
{
  return inheritedC_->make(obj, loc, interp);
}

ELObj *VarInheritedC::value(VM &vm, const VarStyleObj *style,
			    Vector<size_t> &dependencies) const
{
  EvalContext::CurrentNodeSetter cns(style->node(), 0, vm);
  vm.actualDependencies = &dependencies;
  return vm.eval(code_.pointer(), style->display());
}

StyleObjIter::StyleObjIter()
: i_(0), vi_(0)
{
}

void StyleObjIter::append(const Vector<ConstPtr<InheritedC> > *v, const VarStyleObj *obj)
{
  styleVec_.push_back(obj);
  vecs_.push_back(v);
}

ConstPtr<InheritedC> StyleObjIter::next(const VarStyleObj *&style)
{
  for (; vi_ < vecs_.size(); vi_++, i_ = 0) {
    if (i_ < vecs_[vi_]->size()) {
      style = styleVec_[vi_];
      return (*vecs_[vi_])[i_++];
    }
  }
  return ConstPtr<InheritedC>();
}

StyleSpec::StyleSpec(Vector<ConstPtr<InheritedC> > &fs, Vector<ConstPtr<InheritedC> > &s)
{
  fs.swap(forceSpecs);
  s.swap(specs);
}

#ifdef DSSSL_NAMESPACE
}
#endif

