// Copyright (c) 1996 James Clark
// See the file copying.txt for copying permission.

#include "stylelib.h"
#include "SchemeParser.h"
#include "InterpreterMessages.h"
#include "Pattern.h"
#include "MacroFlowObj.h"
#include "macros.h"
#include <stdlib.h>
#include "LangObj.h"
#include "VM.h"
#include "ELObjMessageArg.h"
#include "DssslSpecEventHandler.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

const Char defaultChar = 0xfffd;

SchemeParser::SchemeParser(Interpreter &interp,
			   Owner<InputSource> &in)
: interp_(&interp),
  defMode_(interp.initialProcessingMode()),
  dsssl2_(interp.dsssl2()),
  lang_(0)
{
  in_.swap(in);
  {
    StringC tem(Interpreter::makeStringC("ISO/IEC 10036/RA//Glyphs"));
    afiiPublicId_ = interp_->storePublicId(tem.data(), tem.size(), Location());
  }
}

void SchemeParser::parseStandardChars() 
{
  for (;;) {
    Token tok;
    if (!getToken(allowIdentifier|allowEndOfEntity, tok) 
         || tok == tokenEndOfEntity)
      break;

    StringC name(currentToken_);

    if (!getToken(allowOtherExpr, tok) || tok != tokenNumber) {
      message(InterpreterMessages::badDeclaration);
      break;
    }

    int i; 
    for (i = 0; i < name.size(); i++) 
      if (interp_->lexCategory(name[i]) != Interpreter::lexLetter
          && ((i == 0) || 
              (interp_->lexCategory(name[i]) != Interpreter::lexDigit
               && name[i] != '-' && name[i] != '.'))) 
        break;
    if (i < name.size() || name.size() == 1) {
      message(InterpreterMessages::invalidCharName,
              StringMessageArg(name));
      continue;
    } 

    for (i = 0; i < currentToken_.size(); i++)
      if (interp_->lexCategory(currentToken_[i]) != Interpreter::lexDigit)
        break;       
 
    if (i < currentToken_.size()) {
      message(InterpreterMessages::invalidCharNumber,
              StringMessageArg(currentToken_));
      continue;
    }

    interp_->addStandardChar(name, currentToken_);
  }
}

void SchemeParser::parseNameChars()
{
  for (;;) {
    // FIXME we do not check that we have valid character names
    Token tok;
    if (!getToken(allowIdentifier|allowEndOfEntity, tok) 
         || tok == tokenEndOfEntity)
      break;
    interp_->addNameChar(currentToken_);
  }
}

void SchemeParser::parseSeparatorChars()
{
  for (;;) {
    // FIXME we do not check that we have valid character names
    Token tok;
    if (!getToken(allowIdentifier|allowEndOfEntity, tok)
        || tok == tokenEndOfEntity)
      break;
    interp_->addSeparatorChar(currentToken_);
  }
}

void SchemeParser::parseMapSdataEntity(const StringC &ename, const StringC &etext)
{
  Token tok;
  if (!getToken(allowIdentifier|allowEndOfEntity, tok) 
       || tok == tokenEndOfEntity) {
    message(InterpreterMessages::badDeclaration);
    return;
  }

  interp_->addSdataEntity(ename, etext, currentToken_);
}

void SchemeParser::parse()
{
  bool recovering = 0;
  for (;;) {
    Token tok;
    if (!getToken(recovering ? ~0 : allowOpenParen|allowEndOfEntity,
		 tok))
      recovering = 1;
    else {
      if (tok == tokenEndOfEntity)
	break;
      if (tok != tokenOpenParen
	  || !getToken(recovering ? ~0 : unsigned(allowIdentifier), tok)
	  || tok != tokenIdentifier)
	recovering = 1;
      else {
	const Identifier *ident = lookup(currentToken_);
	Identifier::SyntacticKey key;
	if (!ident->syntacticKey(key)) {
	  if (!recovering)
	    message(InterpreterMessages::unknownTopLevelForm,
		    StringMessageArg(currentToken_));
	  recovering = 1;
	}
	else {
	  switch (key) {
	  case Identifier::keyDefine:
	    recovering = !doDefine();
	    break;
	  case Identifier::keyDefineUnit:
	    recovering = !doDefineUnit();
	    break;
	  case Identifier::keyDefault:
	    recovering = !doDefault();
	    break;
	  case Identifier::keyElement:
	    recovering = !doElement();
	    break;
	  case Identifier::keyOrElement:
	    recovering = !doOrElement();
	    break;
	  case Identifier::keyRoot:
	    recovering = !doRoot();
	    break;
	  case Identifier::keyId:
	    recovering = !doId();
	    break;
	  case Identifier::keyMode:
	    recovering = !doMode();
	    break;
	  case Identifier::keyDeclareInitialValue:
	    recovering = !doDeclareInitialValue();
	    break;
	  case Identifier::keyDeclareCharacteristic:
	    recovering = !doDeclareCharacteristic();
	    break;
	  case Identifier::keyDeclareFlowObjectClass:
	    recovering = !doDeclareFlowObjectClass();
	    break;
	  case Identifier::keyDeclareClassAttribute:
	    recovering = !doDeclareClassAttribute();
	    break;
	  case Identifier::keyDeclareIdAttribute:
	    recovering = !doDeclareIdAttribute();
	    break;
	  case Identifier::keyDeclareFlowObjectMacro:
	    recovering = !doDeclareFlowObjectMacro();
	    break;
	  case Identifier::keyDeclareDefaultLanguage:
            recovering = !doDeclareDefaultLanguage();
            break;
	  case Identifier::keyDefineLanguage:
            recovering = !doDefineLanguage();
            break;
	  case Identifier::keyDeclareCharProperty:
            recovering = !doDeclareCharProperty();
            break;
	  case Identifier::keyAddCharProperties:
            recovering = !doAddCharProperties();
            break;
	  case Identifier::keyDeclareCharCharacteristicAndProperty:
	    recovering = !doDeclareCharCharacteristicAndProperty();
	    break;
	  case Identifier::keyDeclareReferenceValueType:
	  case Identifier::keyDefinePageModel:
	  case Identifier::keyDefineColumnSetModel:
	    recovering = !skipForm();
	    break;
	  default:
	    if (!recovering)
	      message(InterpreterMessages::unknownTopLevelForm,
		      StringMessageArg(currentToken_));
	    recovering = 1;
	    break;
	  }
	}
      }
    }
  }
#if 0
  NamedTableIter<Identifier> iter(identTable_);
  for (;;) {
    Identifier *ident = iter.next();
    if (!ident)
      break;
    Location loc;
    unsigned part;
    if (ident->defined(part, loc)) {
      ELObj *obj = ident->computeValue(1, *this);
      if (!isError(obj)) {
	*os_ << ident->name() << "=";
	obj->print(*this, *os_);
	*os_ << OutputCharStream::newline;
	os_->flush();
      }
    }
  }
#endif
}

bool SchemeParser::parseExpression(Owner<Expression> &expr)
{
  Identifier::SyntacticKey key;
  Token tok;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  getToken(allowEndOfEntity, tok);
  return 1;
}

bool SchemeParser::doMode()
{
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  defMode_ = lookupProcessingMode(currentToken_);
  defMode_->setDefined();
  for (;;) {
    if (!getToken(allowOpenParen|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    if (!getToken(allowIdentifier, tok))
      return 0;
    const Identifier *ident = lookup(currentToken_);
    Identifier::SyntacticKey key;
    if (!ident->syntacticKey(key)) {
      message(InterpreterMessages::badModeForm,
	      StringMessageArg(currentToken_));
      return 0;
    }
    else {
      switch (key) {
      case Identifier::keyDefault:
	if (!doDefault())
	  return 0;
	break;
      case Identifier::keyElement:
	if (!doElement())
	  return 0;
	break;
      case Identifier::keyOrElement:
	if (!doOrElement())
	  return 0;
	break;
      case Identifier::keyRoot:
	if (!doRoot())
	  return 0;
	break;
      case Identifier::keyId:
	if (!doId())
	  return 0;
	break;
      default:
	message(InterpreterMessages::badModeForm,
		StringMessageArg(currentToken_));
	return 0;
      }
    }
  }
  defMode_ = interp_->initialProcessingMode();
  return 1;
}

bool SchemeParser::doElement()
{
  Location loc(in_->currentLocation());
  Token tok;
  ELObj *obj;
  if (!parseDatum(0, obj, loc, tok))
    return 0;
  NCVector<Pattern> patterns(1);
  Owner<Expression> expr;
  ProcessingMode::RuleType ruleType;
  if (interp_->convertToPattern(obj, loc, patterns[0])) {
    if (!parseRuleBody(expr, ruleType))
      return 0;
    defMode_->addRule(0, patterns, expr, ruleType, loc, *interp_);
  }
  else if (!parseRuleBody(expr, ruleType))
    return 0;
  return 1;
}

bool SchemeParser::doOrElement()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowOpenParen, tok))
    return 0;
  NCVector<Pattern> patterns;
  unsigned allowed = 0;
  bool ok = 1;
  for (;;) {
    ELObj *obj;
    if (!parseDatum(allowed, obj, loc, tok))
      return 0;
    if (!obj)
      break;
    allowed = allowCloseParen;
    if (ok) {
      patterns.resize(patterns.size() + 1);
      if (!interp_->convertToPattern(obj, loc, patterns.back()))
	ok = 0;
    }
  }
  ProcessingMode::RuleType ruleType;
  Owner<Expression> expr;
  if (!parseRuleBody(expr, ruleType))
    return 0;
  if (ok)
    defMode_->addRule(0, patterns, expr, ruleType, loc, *interp_);
  return 1;
}

bool SchemeParser::doId()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowString|allowIdentifier, tok))
    return 0;
  StringC id(currentToken_);
  Owner<Expression> expr;
  ProcessingMode::RuleType ruleType;
  if (!parseRuleBody(expr, ruleType))
    return 0;
  IList<Pattern::Element> list;
  Pattern::Element *elem = new Pattern::Element(StringC());
  list.insert(elem);
  elem->addQualifier(new Pattern::IdQualifier(id));
  Pattern pattern(list);
  NCVector<Pattern> patterns(1);
  patterns[0].swap(pattern);
  defMode_->addRule(0, patterns, expr, ruleType, loc, *interp_);
  return 1;
}

bool SchemeParser::doDefault()
{
  Location loc(in_->currentLocation());
  Owner<Expression> expr;
  ProcessingMode::RuleType ruleType;
  if (!parseRuleBody(expr, ruleType))
    return 0;
  IList<Pattern::Element> list;
  list.insert(new Pattern::Element(StringC()));
  Pattern pattern(list);
  NCVector<Pattern> patterns(1);
  pattern.swap(patterns[0]);
  defMode_->addRule(0, patterns, expr, ruleType, loc, *interp_);
  return 1;
}

bool SchemeParser::doRoot()
{
  Location loc(in_->currentLocation());
  Owner<Expression> expr;
  ProcessingMode::RuleType ruleType;
  if (!parseRuleBody(expr, ruleType))
    return 0;
  NCVector<Pattern> patterns;
  defMode_->addRule(1, patterns, expr, ruleType, loc, *interp_);
  return 1;
}

bool SchemeParser::parseRuleBody(Owner<Expression> &expr, ProcessingMode::RuleType &ruleType)
{
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  const Identifier *k = dsssl2() ? expr->keyword() : 0;
  if (k) {
    // style rule
    Vector<const Identifier *> keys;
    NCVector<Owner<Expression> > exprs;
    for (;;) {
      keys.push_back(k);
      exprs.resize(exprs.size() + 1);
      if (!parseExpression(0, exprs.back(), key, tok))
        return 0;
      if (!getToken(allowKeyword|allowCloseParen, tok))
	return 0;
      if (tok == tokenCloseParen)
	break;
      k = lookup(currentToken_);
    }
    expr = new StyleExpression(keys, exprs, expr->location());
    ruleType = ProcessingMode::styleRule;
  }
  else {
    ruleType = ProcessingMode::constructionRule;
    if (!getToken(allowCloseParen, tok))
      return 0;
  }
  return 1;
}

bool SchemeParser::doDeclareInitialValue()
{
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  if (ident->inheritedC().isNull())
    message(InterpreterMessages::notABuiltinInheritedC,
	    StringMessageArg(ident->name()));
  Owner<Expression> expr;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  if (ident->inheritedC().isNull())
    return 1;
  interp_->installInitialValue(ident, expr);
  return 1;
}

bool SchemeParser::doDeclareCharCharacteristicAndProperty()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  if (!getToken(allowString|(dsssl2() ? unsigned(allowFalse) : 0), tok))
    return 0;
  StringC pubid;
  if (tok == tokenString)
    pubid = currentToken_;
  Owner<Expression> expr;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if (ident->inheritedCDefined(defPart, defLoc)) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateCharacteristic,
		       StringMessageArg(ident->name()),
		       defLoc);
  } 
  else if (ident->charNICDefined(defPart, defLoc)
           && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex()) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateCharacteristic,
		       StringMessageArg(ident->name()),
		       defLoc);
    }
  }
  else {
    interp_->installExtensionCharNIC(ident, pubid, loc);
    interp_->addCharProperty(ident, expr);
  }
  return 1;
}

bool SchemeParser::doDeclareCharacteristic()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  if (!getToken(allowString|(dsssl2() ? unsigned(allowFalse) : 0), tok))
    return 0;
  StringC pubid;
  if (tok == tokenString)
    pubid = currentToken_;
  Owner<Expression> expr;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if (ident->charNICDefined(defPart, defLoc)) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateCharacteristic,
		       StringMessageArg(ident->name()),
		       defLoc);
  } 
  else if (ident->inheritedCDefined(defPart, defLoc)
           && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex()) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateCharacteristic,
		       StringMessageArg(ident->name()),
		       defLoc);
    }
  }
  else {
    interp_->installExtensionInheritedC(ident, pubid, loc);
    interp_->installInitialValue(ident, expr);
  }
  return 1;
}

bool SchemeParser::doDeclareFlowObjectClass()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  if (!getToken(allowString, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if (ident->inheritedCDefined(defPart, defLoc)
      && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex()) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateFlowObjectClass,
		       StringMessageArg(ident->name()),
		       defLoc);
    }
  }
  else
    interp_->installExtensionFlowObjectClass(ident, currentToken_, loc);
  if (!getToken(allowCloseParen, tok))
    return 0;
  return 1;
}

bool SchemeParser::doDeclareFlowObjectMacro()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  if (ident->flowObj())
    // FIXME report an error if same part
    ;
  if (!getToken(allowOpenParen, tok))
    return 0;
  Vector<const Identifier *> nics;
  NCVector<Owner<Expression> > inits;
  const Identifier *contentsId = 0;
  unsigned allowed = (allowOpenParen|allowCloseParen|allowIdentifier|allowHashContents);
  for (;;) {
    if (!getToken(allowed, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    switch (tok) {
    case tokenHashContents:
      if (!getToken(allowIdentifier, tok))
	return 0;
      contentsId = lookup(currentToken_);
      allowed = allowCloseParen;
      break;
    case tokenIdentifier:
      nics.push_back(lookup(currentToken_));
      break;
    case tokenOpenParen:
      {
	if (!getToken(allowIdentifier, tok))
	  return 0;
	nics.push_back(lookup(currentToken_));
	inits.resize(nics.size());
	Identifier::SyntacticKey key;
	if (!parseExpression(0, inits.back(), key, tok))
	  return 0;
	if (!getToken(allowCloseParen, tok))
	  return 0;
      }
      break;
    default:
      CANNOT_HAPPEN();
    }
  }
  // We could allow sequence which is appended together here.
  Owner<Expression> body;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, body, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if (ident->inheritedCDefined(defPart, defLoc)
      && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex()) {
      interp_->setNextLocation(loc);
      interp_->message(InterpreterMessages::duplicateFlowObjectClass,
		       StringMessageArg(ident->name()),
		       defLoc);
    }
  }
  else {
    MacroFlowObj *flowObj
      = new (*interp_) MacroFlowObj(nics, inits, contentsId, body);
    interp_->makePermanent(flowObj);
    ident->setFlowObj(flowObj);
  }
  return 1;
}

bool SchemeParser::doDeclareClassAttribute()
{
  Token tok;
  if (!getToken(allowString|allowIdentifier, tok))
    return 0;
  interp_->addClassAttributeName(currentToken_);
  if (!getToken(allowCloseParen, tok))
    return 0;
  return 1;
}

bool SchemeParser::doDeclareIdAttribute()
{
  Token tok;
  if (!getToken(allowString|allowIdentifier, tok))
    return 0;
  interp_->addIdAttributeName(currentToken_);
  if (!getToken(allowCloseParen, tok))
    return 0;
  return 1;
}

bool SchemeParser::doDefine()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowOpenParen|allowIdentifier, tok))
    return 0;
  Vector<const Identifier *> formals;
  bool isProcedure;
  if (tok == tokenOpenParen) {
    if (!getToken(allowIdentifier, tok))
      return 0;
    isProcedure = 1;
  }
  else
    isProcedure = 0;
  Identifier *ident = lookup(currentToken_);
  Identifier::SyntacticKey key;
  if (ident->syntacticKey(key) && key <= int(Identifier::lastSyntacticKey))
    message(InterpreterMessages::syntacticKeywordAsVariable,
	    StringMessageArg(currentToken_));
  NCVector<Owner<Expression> > inits;
  int nOptional;
  int nKey;
  bool hasRest;
  if (isProcedure && !parseFormals(formals, inits, nOptional, hasRest, nKey))
    return 0;
  Owner<Expression> expr;
  if (isProcedure) {
    if (!parseBegin(expr))
      return 0;
  }
  else {
    if (!parseExpression(0, expr, key, tok))
      return 0;
    if (!getToken(allowCloseParen, tok))
      return 0;
  }
  if (isProcedure)
    expr = new LambdaExpression(formals, inits, nOptional, hasRest, nKey,
				expr, loc);
  Location defLoc;
  unsigned defPart;
  if (ident->defined(defPart, defLoc)
      && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex())
      message(InterpreterMessages::duplicateDefinition,
	      StringMessageArg(ident->name()),
	      defLoc);
  }
  else
    ident->setDefinition(expr, interp_->currentPartIndex(), loc);
  return 1;
}

bool SchemeParser::doDefineUnit()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  int i;
  for (i = 0; i < currentToken_.size(); i++)
    if (interp_->lexCategory(currentToken_[i]) != Interpreter::lexLetter)
      break;
  if ((i < currentToken_.size())
       || ((currentToken_.size() == 1) && (currentToken_[0] =='e'))) {
    message(InterpreterMessages::invalidUnitName,
            StringMessageArg(currentToken_));
    return 0;
  } 

  Unit *unit = interp_->lookupUnit(currentToken_);
  Owner<Expression> expr;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if (unit->defined(defPart, defLoc)
      && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex())
      message(InterpreterMessages::duplicateUnitDefinition,
	      StringMessageArg(unit->name()),
	      defLoc);
  }
  else
    unit->setDefinition(expr, interp_->currentPartIndex(), loc);
  return 1;
}

bool SchemeParser::skipForm()
{
  static const unsigned allow = (~0 & ~allowEndOfEntity);
  unsigned level = 0;
  for (;;) {
    Token tok;
    if (!getToken(allow, tok))
      break;
    switch (tok) {
    case tokenOpenParen:
      level++;
      break;
    case tokenCloseParen:
      if (level == 0)
	return 1;
      level--;
      break;
    default:
      break;
    }
  }
  return 0;
}

bool SchemeParser::parseExpression(unsigned allowed,
				  Owner<Expression> &expr,
				  Identifier::SyntacticKey &key,
				  Token &tok)
{
  expr.clear();
  key = Identifier::notKey;
  ELObj *obj;
  if (!parseSelfEvaluating(allowed, obj, tok))
    return 0;
  if (obj) {
    interp_->makePermanent(obj);
    expr = new ConstantExpression(obj, in_->currentLocation());
    return 1;
  }
  switch (tok) {
  case tokenQuote:
    {
      Location loc;
      if (!parseDatum(0, obj, loc, tok))
	return 0;
      interp_->makePermanent(obj);
      expr = new ConstantExpression(obj, loc);
      break;
    }
  case tokenQuasiquote:
    {
      bool spliced;
      return parseQuasiquoteTemplate(0, 0, expr, key, tok, spliced);
    }
  case tokenOpenParen:
    {
      Location loc(in_->currentLocation());
      if (!parseExpression(allowExpressionKey, expr, key, tok))
	return 0;
      if (expr) {
	NCVector<Owner<Expression> > args;
	for (;;) {
	  args.resize(args.size() + 1);
	  if (!parseExpression(allowCloseParen, args.back(), key, tok))
	    return 0;
	  if (!args.back()) {
	    args.resize(args.size() - 1);
	    break;
	  }
	}
	expr = new CallExpression(expr, args, loc);
      }
      else {
	switch (key) {
	case Identifier::keyQuote:
          return parseQuote(expr);
	case Identifier::keyLambda:
	  return parseLambda(expr);
	case Identifier::keyIf:
	  return parseIf(expr);
	case Identifier::keyCond:
	  return parseCond(expr);
	case Identifier::keyAnd:
	  return parseAnd(expr);
	case Identifier::keyOr:
	  return parseOr(expr);
	case Identifier::keyCase:
	  return parseCase(expr);
	case Identifier::keyLet:
	  return parseLet(expr);
	case Identifier::keyLetStar:
	  return parseLetStar(expr);
	case Identifier::keyLetrec:
	  return parseLetrec(expr);
        case Identifier::keyThereExists:
          return parseSpecialQuery(expr, "node-list-some?");
        case Identifier::keyForAll:
          return parseSpecialQuery(expr, "node-list-every?");
        case Identifier::keySelectEach:
          return parseSpecialQuery(expr, "node-list-filter");
        case Identifier::keyUnionForEach:
          return parseSpecialQuery(expr, "node-list-union-map");
	case Identifier::keyMake:
	  return parseMake(expr);
	case Identifier::keyStyle:
	  return parseStyle(expr);
	case Identifier::keyWithMode:
	  return parseWithMode(expr);
	case Identifier::keyQuasiquote:
	  return parseQuasiquote(expr);
	case Identifier::keySet:
	  return parseSet(expr);
	case Identifier::keyBegin:
	  return parseBegin(expr);
	default:
	  CANNOT_HAPPEN();
	}
      }
      break;
    }
  case tokenIdentifier:
    {
      const Identifier *ident = lookup(currentToken_);
      if (ident->syntacticKey(key) && key <= int(Identifier::lastSyntacticKey)) {
	switch (key) {
	case Identifier::keyDefine:
	  if (allowed & allowKeyDefine)
	    return 1;
	  break;
	case Identifier::keyArrow:
	  if (allowed & allowKeyArrow)
	    return 1;
	  break;
	case Identifier::keyElse:
	  if (allowed & allowKeyElse)
	    return 1;
	  break;
	case Identifier::keyUnquote:
	case Identifier::keyUnquoteSplicing:
	  break;
	default:
	  if (allowed & allowExpressionKey)
	    return 1;
	  break;
	}
	message(InterpreterMessages::syntacticKeywordAsVariable,
		StringMessageArg(currentToken_));
      }
      expr = new VariableExpression(ident, in_->currentLocation());
    }
    break;
  default:
    break;
  }
  return 1;
}


bool SchemeParser::parseQuote(Owner<Expression> &expr)
{
  Token tok;
  Location loc;
  ELObj *obj;
  if (!parseDatum(0, obj, loc, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  interp_->makePermanent(obj);
  expr = new ConstantExpression(obj, loc);
  return 1;
}

bool SchemeParser::parseQuasiquote(Owner<Expression> &expr)
{
  bool spliced;
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseQuasiquoteTemplate(0, 0, expr, key, tok, spliced))
    return 0;
  return getToken(allowCloseParen, tok);
}

bool SchemeParser::parseQuasiquoteTemplate(unsigned level,
					  unsigned allowed,
					  Owner<Expression> &expr,
					  Identifier::SyntacticKey &key,
					  Token &tok,
					  bool &spliced)
{
  key = Identifier::notKey;
  spliced = 0;
  ELObj *obj;
  if (!parseSelfEvaluating(allowed|allowUnquote|allowVector, obj, tok))
    return 0;
  switch (tok) {
  case tokenQuasiquote:
    if (!parseQuasiquoteTemplate(level + 1, 0, expr, key, tok, spliced))
      return 0;
    createQuasiquoteAbbreviation("quasiquote", expr);
    break;
  case tokenQuote:
    if (!parseQuasiquoteTemplate(level, 0, expr, key, tok, spliced))
      break;
    createQuasiquoteAbbreviation("quote", expr);
    break;
  case tokenUnquote:
  case tokenUnquoteSplicing:
    if (level == 0) {
      spliced = (tok == tokenUnquoteSplicing);
      if (!parseExpression(0, expr, key, tok))
	return 0;
    }
    else {
      Token tem;
      if (!parseQuasiquoteTemplate(level - 1, 0, expr, key, tem, spliced))
	break;
      createQuasiquoteAbbreviation(tok == tokenUnquote ? "unquote" : "unquote-splicing", expr);
    }
    break;
  case tokenOpenParen:
  case tokenVector:      
    {
      QuasiquoteExpression::Type type
	= (tok == tokenVector
	   ? QuasiquoteExpression::vectorType
	   : QuasiquoteExpression::listType);
      Location loc(in_->currentLocation());
      NCVector<Owner<Expression> > exprs(1);
      Vector<PackedBoolean> exprsSpliced;
      bool temSpliced;
      if (!parseQuasiquoteTemplate(level,
				   allowCloseParen|allowQuasiquoteKey|allowUnquoteSplicing,
				   exprs[0], key, tok, temSpliced))
	return 0;
      if (!exprs[0]) {
	switch (key) {
	case Identifier::keyQuasiquote:
	  if (!parseQuasiquoteTemplate(level + 1, 0, expr, key, tok, spliced))
	    return 0;
	  createQuasiquoteAbbreviation("quasiquotation", expr);
	  break;
	case Identifier::keyUnquoteSplicing:
	  spliced = 1;
	  // fall through
	case Identifier::keyUnquote:
	  if (level == 0) {
	    if (!parseExpression(0, expr, key, tok))
	      return 0;
	  }
	  else {
	    if (!parseQuasiquoteTemplate(level - 1, 0, expr, key, tok, temSpliced))
	      return 0;
	    createQuasiquoteAbbreviation(spliced ? "unquote-splicing" : "unquote", expr);
	    spliced = 0;
	  }
	  break;
	default:
	   expr = new ConstantExpression(interp_->makeNil(), loc);
	   return 1;
	}
	return getToken(allowCloseParen, tok);
      }
      exprsSpliced.push_back(PackedBoolean(temSpliced));
      for (;;) {
	Owner<Expression> tem;
	if (!parseQuasiquoteTemplate(level,
				     allowCloseParen|allowUnquoteSplicing
				     |(type == QuasiquoteExpression::vectorType
				       ? 0
				       : allowPeriod),
				     tem, key, tok, temSpliced))
	  return 0;
	if (!tem) {
	  if (tok == tokenCloseParen)
	    break;
	  exprs.resize(exprs.size() + 1);
	  type = QuasiquoteExpression::improperType;
	  if (!parseQuasiquoteTemplate(level, 0, exprs.back(), key, tok, temSpliced))
	    return 0;
	  if (!getToken(allowCloseParen, tok))
	    return 0;
	  exprsSpliced.push_back(0);
	  break;
	}
	exprs.resize(exprs.size() + 1);
	exprs.back().swap(tem);
	exprsSpliced.push_back(PackedBoolean(temSpliced));
      }
      expr = new QuasiquoteExpression(exprs, exprsSpliced, type, loc);
    }
    break;
  case tokenIdentifier:
    if (allowed & allowQuasiquoteKey) {
      const Identifier *ident = lookup(currentToken_);
      if (ident->syntacticKey(key)) {
	switch (key) {
	case Identifier::keyUnquoteSplicing:
	case Identifier::keyUnquote:
	case Identifier::keyQuasiquote:
	  return 1;
	default:
	  break;
	}
      }
    }
    obj = interp_->makeSymbol(currentToken_);
    // fall through
  default:
    if (obj) {
      interp_->makePermanent(obj);
      expr = new ConstantExpression(obj, in_->currentLocation());
    }
    break;
  }
  return 1;
}

void SchemeParser::createQuasiquoteAbbreviation(const char *sym, Owner<Expression> &expr)
{
  Location loc(expr->location());
  NCVector<Owner<Expression> > v(2);
  v[1].swap(expr);
  v[0] = new ConstantExpression(interp_->makeSymbol(Interpreter::makeStringC(sym)), loc);
  Vector<PackedBoolean> spliced;
  spliced.push_back(0);
  spliced.push_back(0);
  expr = new QuasiquoteExpression(v, spliced, QuasiquoteExpression::listType, loc);
}

bool SchemeParser::parseIf(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Owner<Expression> expr0, expr1, expr2;
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr0, key, tok)
      || !parseExpression(0, expr1, key, tok)      
      || !parseExpression(dsssl2() ? allowCloseParen : 0, expr2, key, tok))
    return 0;
  if (!expr2)
    expr2 = new ConstantExpression(interp_->makeUnspecified(), in_->currentLocation());
  else if (!getToken(allowCloseParen, tok))
    return 0;
  expr = new IfExpression(expr0, expr1, expr2, loc);
  return 1;
}

bool SchemeParser::parseCond(Owner<Expression> &expr, bool opt)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowOpenParen|(opt ? unsigned(allowCloseParen) : 0), tok))
    return 0;
  if (tok == tokenCloseParen) {
    if (dsssl2())
      expr = new ConstantExpression(interp_->makeUnspecified(), loc);
    else
      expr = new CondFailExpression(loc);
    return 1;
  }
  Identifier::SyntacticKey key;
  Owner<Expression> testExpr;
  if (!parseExpression(allowKeyElse, testExpr, key, tok))
    return 0;
  if (!testExpr) {
    if (!parseBegin(expr))
      return 0;
    return getToken(allowCloseParen, tok);
  }
  NCVector<Owner<Expression> > valExprs;
  for (;;) {
    Owner<Expression> tem;
    if (!parseExpression(allowCloseParen, tem, key, tok))
      return 0;
    if (!tem)
      break;
    valExprs.resize(valExprs.size() + 1);
    tem.swap(valExprs.back());
  }
  Owner<Expression> valExpr;
  if (valExprs.size() == 1)
    valExprs[0].swap(valExpr);
  else if (valExprs.size())
    valExpr = new SequenceExpression(valExprs, valExprs[0]->location());
  Owner<Expression> elseExpr;
  if (!parseCond(elseExpr, 1))
    return 0;
  if (valExpr)
    expr = new IfExpression(testExpr, valExpr, elseExpr, loc);
  else
    expr = new OrExpression(testExpr, elseExpr, loc);
  return 1;
}

bool SchemeParser::parseCase(Owner<Expression> &expr)
{
  Owner<Expression> keyExpr;
  Owner<Expression> elseClause;
  NCVector<CaseExpression::Case> cases;
  Location loc(in_->currentLocation());
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, keyExpr, key, tok))
    return 0;
  for (;;) {
    if (!getToken(allowOpenParen
      |(cases.size() ? unsigned(allowCloseParen) : 0), tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    if (!getToken(allowOpenParen|allowIdentifier, tok))
      return 0;
    if (tok == tokenOpenParen) {
      cases.resize(cases.size() + 1);
      Location loc;
      for (;;) {
	ELObj *obj;
	if (!parseDatum(allowCloseParen, obj, loc, tok))
	  return 0;
	if (tok == tokenCloseParen)
	  break;
	interp_->makePermanent(obj);
	cases.back().datums.push_back(obj);
      }
      if (!parseBegin(cases.back().expr))
	return 0;
    }
    else {
      const Identifier *ident = lookup(currentToken_);
      if (ident->syntacticKey(key) && key == Identifier::keyElse) {
	if (!parseBegin(elseClause))
	  return 0;
	if (!getToken(allowCloseParen, tok))
	  return 0;
	break;
      }
      else {
	message(InterpreterMessages::caseElse,
		StringMessageArg(currentToken_));
	return 0;
      }
    }
  }
  if (dsssl2() && !elseClause)
    elseClause = new ConstantExpression(interp_->makeUnspecified(), loc);
  expr = new CaseExpression(keyExpr, cases, elseClause, loc);
  return 1;
}

bool SchemeParser::parseOr(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  Identifier::SyntacticKey key;
  Owner<Expression> test1Expr;
  if (!parseExpression(allowCloseParen, test1Expr, key, tok))
    return 0;
  if (!test1Expr) {
    expr = new ConstantExpression(interp_->makeFalse(), loc);
    return 1;
  }
  Owner<Expression> test2Expr;
  if (!parseOr(test2Expr))
    return 0;
  expr = new OrExpression(test1Expr, test2Expr, loc);
  return 1;
}

bool SchemeParser::parseAnd(Owner<Expression> &expr, bool opt)
{
  Location loc(in_->currentLocation());
  Token tok;
  Identifier::SyntacticKey key;
  Owner<Expression> testExpr;
  if (!parseExpression(allowCloseParen, testExpr, key, tok))
    return 0;
  if (!testExpr) {
    if (!opt)
      expr = new ConstantExpression(interp_->makeTrue(), loc);
    return 1;
  }
  Owner<Expression> restExpr;
  if (!parseAnd(restExpr, 1))
    return 0;
  if (!restExpr)
    testExpr.swap(expr);
  else {
    // This relies on the fact that #f is the only false value.
    Owner<Expression> falseExpr(new ConstantExpression(interp_->makeFalse(), loc));
    expr = new IfExpression(testExpr, restExpr, falseExpr, loc);
  }
  return 1;
}

bool SchemeParser::parseBegin(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (dsssl2()) {
    NCVector<Owner<Expression> > exprs;
    for (size_t i = 1;; i++) {
      Owner<Expression> tem;
      if (!parseExpression(allowCloseParen, tem, key, tok))
	return 0;
      if (!tem)
	break;
      exprs.resize(i + 1);
      tem.swap(exprs[i]);
    }
    if (exprs.size()) {
      expr.swap(exprs[0]);
      expr = new SequenceExpression(exprs, loc);
    }
    return 1;
  }
  else
    return getToken(allowCloseParen, tok);
}

bool SchemeParser::parseSet(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
      return 0;
  const Identifier *var = lookup(currentToken_);
  Identifier::SyntacticKey key;
  Owner<Expression> value;
  if (!parseExpression(0, value, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  expr = new AssignmentExpression(var, value, loc);
  return 1;
}

bool SchemeParser::parseWithMode(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier|allowFalse, tok))
    return 0;
  const ProcessingMode *mode;
  if (tok == tokenFalse)
    mode = interp_->initialProcessingMode();
  else
    mode = interp_->lookupProcessingMode(currentToken_);
  Owner<Expression> content;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, content, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  expr = new WithModeExpression(mode, content, loc);
  return 1;
}

bool SchemeParser::parseMake(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  const Identifier *foc = lookup(currentToken_);
  NCVector<Owner<Expression> > exprs;
  Vector<const Identifier *> keys;
  for (;;) {
    Owner<Expression> tem;
    Identifier::SyntacticKey key;
    if (!parseExpression(allowCloseParen, tem, key, tok))
      return 0;
    if (!tem)
      break;
    if (keys.size() == exprs.size()) {
      const Identifier *k = tem->keyword();
      if (k) {
	tem.clear();
	if (!parseExpression(0, tem, key, tok))
	  return 0;
        size_t i;
        for (i = 0; i < keys.size(); i++) 
          if (keys[i]->name() == k->name()) 
            break;
        if (i < keys.size())
          continue;
        keys.push_back(k);
      }
    }
    exprs.resize(exprs.size() + 1);
    tem.swap(exprs.back());
  }
  expr = new MakeExpression(foc, keys, exprs, loc);
  return 1; 
}

bool SchemeParser::parseStyle(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  NCVector<Owner<Expression> > exprs;
  Vector<const Identifier *> keys;
  for (;;) {
    Token tok;
    if (!getToken(allowKeyword|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    keys.resize(keys.size() + 1);
    keys.back() = lookup(currentToken_);
    exprs.resize(exprs.size() + 1);
    Identifier::SyntacticKey key;
    if (!parseExpression(0, exprs.back(), key, tok))
      return 0;
  }
  expr = new StyleExpression(keys, exprs, loc);
  return 1; 
}

bool SchemeParser::parseLambda(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowOpenParen, tok))
    return 0;
  Vector<const Identifier *> formals;
  NCVector<Owner<Expression> > inits;
  int nOptional;
  int nKey;
  bool hasRest;
  if (!parseFormals(formals, inits, nOptional, hasRest, nKey))
    return 0;
  Owner<Expression> body;
  if (!parseBegin(body))
    return 0;
  expr = new LambdaExpression(formals, inits, nOptional, hasRest, nKey,
			      body, loc);
  return 1;
}

// The rest arg is put last.

bool SchemeParser::parseFormals(Vector<const Identifier *> &formals,
			       NCVector<Owner<Expression> > &inits,
			       int &nOptional,
			       bool &hasRest,
			       int &nKey)
{
  Token tok;
  enum FormalType { required, optional, rest, key } type = required;
  unsigned allowed = (allowCloseParen|allowIdentifier
		      |allowHashOptional|allowHashRest|allowHashKey);
  int argCount[4];
  for (int i = 0; i < 4; i++)
    argCount[i] = 0;
  for (;;) {
    if (!getToken(allowed, tok))
      return 0;
    switch (tok) {
    case tokenHashOptional:
      allowed |= allowOpenParen;
      allowed &= ~allowHashOptional;
      type = optional;
      break;
    case tokenHashRest:
      allowed = allowIdentifier;
      type = rest;
      break;
    case tokenHashKey:
      allowed = (allowOpenParen|allowCloseParen|allowIdentifier);
      type = key;
      break;
    case tokenOpenParen:
      {
	if (!getToken(allowIdentifier, tok))
	  return 0;
	argCount[type]++;
	formals.push_back(lookup(currentToken_));
	inits.resize(argCount[optional] + argCount[key]);
	Identifier::SyntacticKey key;
	if (!parseExpression(0, inits.back(), key, tok))
	  return 0;
	if (!getToken(allowCloseParen, tok))
	  return 0;
      }
      break;
    case tokenIdentifier:
      {
	formals.push_back(lookup(currentToken_));
	argCount[type]++;
	if (type == rest)
	  allowed = (allowHashKey|allowCloseParen);
      }
      break;
    case tokenCloseParen:
      goto done;
    default:
      CANNOT_HAPPEN();
    }
  }
done:
  nOptional = argCount[optional];
  nKey = argCount[key];
  inits.resize(nOptional + nKey);
  hasRest = argCount[rest];
  return 1;
}

bool SchemeParser::parseLet(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowOpenParen|allowIdentifier, tok))
    return 0;
  Vector<const Identifier *> vars;
  NCVector<Owner<Expression> > inits;
  Owner<Expression> body;
  const Identifier *name;
  if (tok == tokenOpenParen) {
    name = 0;
    if (!parseBindingsAndBody1(vars, inits, body))
      return 0;
  }
  else {
    name = lookup(currentToken_);
    if (!parseBindingsAndBody(vars, inits, body))
      return 0;
  }
  if (name) {
    // Named let
    NCVector<Owner<Expression> > loopInit(1);
    NCVector<Owner<Expression> > argsInit;
    loopInit[0] = new LambdaExpression(vars, argsInit, 0, 0, 0, body, loc);
    Vector<const Identifier *> loopFormal(1);
    loopFormal[0] = name;
    expr = new VariableExpression(name, loc);
    expr = new LetrecExpression(loopFormal, loopInit, expr, loc);
    expr = new CallExpression(expr, inits, loc);
 }
 else
   expr = new LetExpression(vars, inits, body, loc);
 return 1;
}

bool SchemeParser::parseLetStar(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Vector<const Identifier *> vars;
  NCVector<Owner<Expression> > inits;
  Owner<Expression> body;
  if (!parseBindingsAndBody(vars, inits, body))
    return 0;
  expr = new LetStarExpression(vars, inits, body, loc);
  return 1;
}

bool SchemeParser::parseLetrec(Owner<Expression> &expr)
{
  Location loc(in_->currentLocation());
  Vector<const Identifier *> vars;
  NCVector<Owner<Expression> > inits;
  Owner<Expression> body;
  if (!parseBindingsAndBody(vars, inits, body))
    return 0;
  expr = new LetrecExpression(vars, inits, body, loc);
  return 1;
}

bool SchemeParser::parseBindingsAndBody(Vector<const Identifier *> &vars,
				       NCVector<Owner<Expression> > &inits,
				       Owner<Expression> &body)
{
  Token tok;
  if (!getToken(allowOpenParen, tok))
    return 0;
  return parseBindingsAndBody1(vars, inits, body);
}

bool SchemeParser::parseBindingsAndBody1(Vector<const Identifier *> &vars,
					NCVector<Owner<Expression> > &inits,
					Owner<Expression> &body)
{
  Token tok;
  Identifier::SyntacticKey key;
  for (;;) {
    if (!getToken(allowCloseParen|allowOpenParen, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    if (!getToken(allowIdentifier, tok))
      return 0;
    vars.push_back(lookup(currentToken_));
    inits.resize(inits.size() + 1);
    if (!parseExpression(0, inits.back(), key, tok))
      return 0;
    if (!getToken(allowCloseParen, tok))
      return 0;
  }
  return parseBegin(body);
}

bool SchemeParser::parseDatum(unsigned otherAllowed,
			     ELObj *&result,
			     Location &loc,
			     Token &tok)
{
  if (!parseSelfEvaluating(otherAllowed|allowVector|allowUnquote|allowUnquoteSplicing, result, tok))
    return 0;
  loc = in_->currentLocation();
  if (result)
    return 1;
  switch (tok) {
  case tokenIdentifier:
    result = interp_->makeSymbol(currentToken_);
    break;
  case tokenQuote:
    return parseAbbreviation("quote", result);
  case tokenQuasiquote:
    return parseAbbreviation("quasiquote", result);
  case tokenUnquote:
    return parseAbbreviation("unquote", result);
  case tokenUnquoteSplicing:
    return parseAbbreviation("unquote-splicing", result);
  case tokenOpenParen:
    {
      ELObj *tem;
      Location ignore;
      if (!parseDatum(allowCloseParen, tem, ignore, tok))
	return 0;
      if (!tem) {
	result = interp_->makeNil();
	break;
      }
      ELObjDynamicRoot list(*interp_, tem);
      PairObj *last = new (*interp_) PairObj(tem, 0);
      list = last;
      for (;;) {
	if (!parseDatum(allowCloseParen|allowPeriod, tem, ignore, tok))
	  return 0;
	if (!tem) {
	  if (tok == tokenCloseParen) {
	    last->setCdr(interp_->makeNil());
	    break;
	  }
	  if (!parseDatum(0, tem, ignore, tok))
	    return 0;
	  last->setCdr(tem);
	  if (!getToken(allowCloseParen, tok))
	    return 0;
	  break;
	}
	last->setCdr(tem); // to protect it
	PairObj *p = new (*interp_) PairObj(tem, 0);
	last->setCdr(p);
	last = p;
      }
      result = list;
    }
    break;
  case tokenVector:
    {
      VectorObj *v = new (*interp_) VectorObj;
      ELObjDynamicRoot protect(*interp_, v);
      Vector<ELObj *> &vec = *v;
      Location ignore;
      for (;;) {
	ELObj *tem;
	if (!parseDatum(allowCloseParen, tem, ignore, tok))
	  return 0;
	if (!tem)
	  break;
	vec.push_back(tem);
      }
      result = v;
    }
    break;
  default:
    break;
  }
  return 1;
}

bool SchemeParser::parseSelfEvaluating(unsigned otherAllowed,
				      ELObj *&result,
				      Token &tok)
{
  if (!getToken(allowExpr|otherAllowed, tok))
    return 0;
  switch (tok) {
  case tokenTrue:
    result = interp_->makeTrue();
    break;
  case tokenFalse:
    result = interp_->makeFalse();
    break;
  case tokenVoid:
    result = interp_->makeUnspecified();
    break;
  case tokenString:
    result = new (*interp_) StringObj(currentToken_);
    break;
  case tokenKeyword:
    result = interp_->makeKeyword(currentToken_);
    break;
  case tokenChar:
    result = interp_->makeChar(currentToken_[0]);
    break;
  case tokenNumber:
    result = interp_->convertNumber(currentToken_);
    if (!result) {
      message(InterpreterMessages::invalidNumber,
	      StringMessageArg(currentToken_));
      result = interp_->makeError();
    }
    break;
  case tokenGlyphId:
    result = convertAfiiGlyphId(currentToken_);
    break;
  default:
    result = 0;
    break;
  }
  return 1;
}

bool SchemeParser::parseAbbreviation(const char *sym, ELObj *&result)
{
  SymbolObj *quoteSym = interp_->makeSymbol(Interpreter::makeStringC(sym));
  ELObj *obj;
  Location ignore;
  Token tok;
  if (!parseDatum(0, obj, ignore, tok))
    return 0;
  ELObjDynamicRoot protect(*interp_, obj);
  protect = new (*interp_) PairObj(protect, interp_->makeNil());
  result = interp_->makePair(quoteSym, protect);
  return 1;
}

bool SchemeParser::getToken(unsigned allowed, Token &tok)
{
  InputSource *in = in_.pointer();
  for (;;) {
    in->startToken();
    Xchar c = in->tokenChar(*this);
    switch (c) {
    case InputSource::eE:
      if (!(allowed & allowEndOfEntity))
	return tokenRecover(allowed, tok);
      tok = tokenEndOfEntity;
      return 1;
    case '(':
      if (!(allowed & allowOpenParen))
	return tokenRecover(allowed, tok);
      tok = tokenOpenParen;
      return 1;
    case ')':
      if (!(allowed & allowCloseParen))
	return tokenRecover(allowed, tok);
      tok = tokenCloseParen;
      return 1;
    case '\'':
      if (!(allowed & allowOtherExpr))
	return tokenRecover(allowed, tok);
      tok = tokenQuote;
      return 1;
    case '`':
      if (!(allowed & allowOtherExpr))
	return tokenRecover(allowed, tok);
      tok = tokenQuasiquote;
      return 1;
    case ',':
      c = in->tokenChar(*this);
      if (c == '@') {
	if (!(allowed & allowUnquoteSplicing))
	  return tokenRecover(allowed, tok);
	tok = tokenUnquoteSplicing;
      }
      else {
	if (!(allowed & allowUnquote))
	  return tokenRecover(allowed, tok);
	tok = tokenUnquote;
	in->endToken(1);
      }
      return 1;
    case ' ':
    case '\r':
    case '\n':
    case '\t':
    case '\f':
      // whitespace
      break;
    case '#':
      c = in->tokenChar(*this);
      switch (c) {
      case 't':
	if (!(allowed & allowOtherExpr))
	  return tokenRecover(allowed, tok);
	tok = tokenTrue;
	return 1;
      case 'f':
	if (!(allowed & allowFalse))
	  return tokenRecover(allowed, tok);
	tok = tokenFalse;
	return 1;
      case '\\':
	{
	  c = in->tokenChar(*this);
	  if (c == InputSource::eE) {
	    message(InterpreterMessages::unexpectedEof);
	    if (allowed & allowEndOfEntity) {
	      tok = tokenEndOfEntity;
	      return 1;
	    }
	    return 0;
	  }
	  if (!(allowed & allowOtherExpr)) {
	    extendToken();
	    return tokenRecover(allowed, tok);
	  }
	  in->discardInitial();
	  extendToken();
      	  tok = tokenChar;
	  if (in->currentTokenLength() == 1) {
	    currentToken_.assign(in->currentTokenStart(), 1);
	  }
	  else {
	    StringC tem(in->currentTokenStart(), in->currentTokenLength());
	    currentToken_.resize(1);
	    if (!interp_->convertCharName(tem, currentToken_[0])) {
	      message(InterpreterMessages::unknownCharName,
		      StringMessageArg(tem));
	      currentToken_[0] = defaultChar;
	    }
	  }
	  return 1;
	}
      case '!':
	{
	  extendToken();
	  StringC tem(in->currentTokenStart() + 2,
	              in->currentTokenLength() - 2);
	  if (tem == Interpreter::makeStringC("optional")) {
	    if (!(allowed & allowHashOptional))
	      return tokenRecover(allowed, tok);
	    tok = tokenHashOptional;
	    return 1;
	  }
	  if (tem == Interpreter::makeStringC("key")) {
	    if (!(allowed & allowHashKey))
	      return tokenRecover(allowed, tok);
	    tok = tokenHashKey;
	    return 1;
	  }
	  if (tem == Interpreter::makeStringC("rest")) {
	    if (!(allowed & allowHashRest))
	      return tokenRecover(allowed, tok);
	    tok = tokenHashRest;
	    return 1;
	  }
	  if (tem == Interpreter::makeStringC("contents")) {
	    if (!(allowed & allowHashContents))
	      return tokenRecover(allowed, tok);
	    tok = tokenHashContents;
	    return 1;
	  }
	  message(InterpreterMessages::unknownNamedConstant,
		  StringMessageArg(tem));
	  break;
	}
      case 'b':
      case 'o':
      case 'x':
      case 'd':
	extendToken();
	if (!(allowed & allowOtherExpr))
	  return tokenRecover(allowed, tok);
	tok = tokenNumber;
	currentToken_.assign(in->currentTokenStart(),
                             in->currentTokenLength());
	return 1;
      case 'A':
	extendToken();
	if (!(allowed & allowOtherExpr))
	  return tokenRecover(allowed, tok);
	tok = tokenGlyphId;
	currentToken_.assign(in->currentTokenStart() + 2,
                             in->currentTokenLength() - 2);
	return 1;
      case InputSource::eE:
	message(InterpreterMessages::unexpectedEof);
	if (allowed & allowEndOfEntity) {
	  tok = tokenEndOfEntity;
	  return 1;
	}
	return 0;
      case 'v':
	if (dsssl2()) {
	  if (!(allowed & allowOtherExpr))
	    return tokenRecover(allowed, tok);
	  tok = tokenVoid;
	  return 1;
	}
	// fall through
      case '(':
	if (dsssl2()) {
	  if (!(allowed & allowVector))
	    return tokenRecover(allowed, tok);
	  tok = tokenVector;
	  return 1;
	}
	//fall through
      default:
	message(InterpreterMessages::unknownHash);
	break;  
      }
      break;
    case '"':
      if (!(allowed & allowString))
	return tokenRecover(allowed, tok);
      return scanString(allowed, tok);
    case ';':
      skipComment();
      break;
    case '.':
      extendToken();
      switch (in->currentTokenLength()) {
      case 1:
	if (!(allowed & allowPeriod))
	  return tokenRecover(allowed, tok);
	tok = tokenPeriod;
	return 1;
      case 3:
        if (in_->currentTokenStart()[1] == '.'
	    && in_->currentTokenStart()[2] == '.')
	  return handleIdentifier(allowed, tok);
	break;
      }
      return handleNumber(allowed, tok);
    default:
      switch (interp_->lexCategory(c)) {
      case Interpreter::lexAddWhiteSpace:
	break;
      case Interpreter::lexOtherNumberStart:
	extendToken();
	// handle + and - as identifiers
	if (in->currentTokenLength() == 1)
	  return handleIdentifier(allowed, tok);
	return handleNumber(allowed, tok);
      case Interpreter::lexDigit:
	extendToken();
	return handleNumber(allowed, tok);
      case Interpreter::lexOther:
	if (c < ' ') {
	  // ignore control characters
	  message(InterpreterMessages::invalidChar);
	  break;
	}
	in->ungetToken();
	// fall through
      default:
	{
	  bool invalid = 0;
	  size_t length = in->currentTokenLength();
	  for (;;) {
	    Interpreter::LexCategory lc = interp_->lexCategory(in->tokenChar(*this));
	    if (lc > Interpreter::lexOther)
	      break;
	    if (lc == Interpreter::lexOther)
	      invalid = 1;
	    length++;
	  }
	  in->endToken(length);

	  if (in->currentTokenEnd()[-1] == ':' 
              && in->currentTokenLength() > 1) {
	    if (!(allowed & allowKeyword))
	      return tokenRecover(allowed, tok);
	    currentToken_.assign(in->currentTokenStart(),
	                         in->currentTokenLength() - 1);
	    tok = tokenKeyword;
	    if (invalid || (currentToken_.size() > 1 
                  && currentToken_[currentToken_.size() - 1] == ':'))
	      message(InterpreterMessages::invalidIdentifier, 
		      StringMessageArg(currentToken_));
	    return 1;
	  }
	  if (invalid)
	    message(InterpreterMessages::invalidIdentifier, 
		    StringMessageArg(StringC(in->currentTokenStart(),
		                             in->currentTokenLength())));
	  return handleIdentifier(allowed, tok);
	}
      }
    }
  }
}

bool SchemeParser::handleNumber(unsigned allowed, Token &tok)
{
  if (!(allowed & allowOtherExpr))
    return tokenRecover(allowed, tok);
  tok = tokenNumber;
  currentToken_.assign(in_->currentTokenStart(),
  	               in_->currentTokenLength());
  return 1;
}

bool SchemeParser::handleIdentifier(unsigned allowed, Token &tok)
{
  if (!(allowed & allowIdentifier))
    return tokenRecover(allowed, tok);
  currentToken_.assign(in_->currentTokenStart(),
	               in_->currentTokenLength());
  tok = tokenIdentifier;
  return 1;
}

bool SchemeParser::tokenRecover(unsigned allowed, Token &tok)
{
  if (allowed == allowCloseParen) {
    in_->ungetToken();
    tok = tokenCloseParen;
    message(InterpreterMessages::missingCloseParen);
    return 1;
  }
  if (in_->currentTokenLength() == 0)
    message(InterpreterMessages::unexpectedEof);
  else
    message(InterpreterMessages::unexpectedToken,
            StringMessageArg(StringC(in_->currentTokenStart(),
	                             in_->currentTokenLength())));
  return 0;
}

void SchemeParser::extendToken()
{
  // extend to a delimiter
  InputSource *in = in_.pointer();
  size_t length = in->currentTokenLength();
  while (interp_->lexCategory(in->tokenChar(*this))
         <= Interpreter::lexOther)
    length++;
  in->endToken(length);
}

bool SchemeParser::scanString(unsigned allowed, Token &tok)
{
  InputSource *in = in_.pointer();
  currentToken_.resize(0);
  for (;;) {
    Xchar c = in->tokenChar(*this);
    switch (c) {
    case InputSource::eE:
      message(InterpreterMessages::unterminatedString);
      in->endToken(1);
      return 0;
    case '"':
      tok = tokenString;
      return 1;
    case '\\':
      c = in->tokenChar(*this);
      if (c == '\\' || c == '"')
	currentToken_ += c;
      else if (c == InputSource::eE)
	break;
      else {
	StringC name;
	name += c;
	while (interp_->lexCategory(c = in->tokenChar(*this)) < Interpreter::lexOther)
	  name += c;
	if (c != ';')
	  in->endToken(in->currentTokenLength() - 1);
	Char ch;
	if (interp_->convertCharName(name, ch))
	  currentToken_ += ch;
	else
	  message(InterpreterMessages::unknownCharName, StringMessageArg(name));
      }
      break;
    default:
      currentToken_ += c;
      break;
    }
  }
  return 0; // not reached
}

void SchemeParser::skipComment()
{
  for (;;) {
    Xchar c = in_->get(*this);
    if (c == InputSource::eE || c == '\r')
      break;
  }
}

ELObj *SchemeParser::convertAfiiGlyphId(const StringC &str)
{
  unsigned long n = 0;
  for (size_t i = 0; i < str.size(); i++) {
    if (str[i] < '0' || str[i] > '9') {
      n = 0;
      break;
    }
    // FIXME check for overflow
    n = n*10 + (str[i] - '0');
  }
  if (n == 0) {
    message(InterpreterMessages::invalidAfiiGlyphId, StringMessageArg(str));
    return 0;
  }
  return new (*interp_) GlyphIdObj(FOTBuilder::GlyphId(afiiPublicId_, n));
}

void SchemeParser::dispatchMessage(Message &msg)
{
  interp_->dispatchMessage(msg);
}

void SchemeParser::dispatchMessage(const Message &msg)
{
  interp_->dispatchMessage(msg);
}

void SchemeParser::initMessage(Message &msg)
{
  if (in_)
    msg.loc = in_->currentLocation();
}

bool SchemeParser::doDeclareDefaultLanguage()
{
  Location loc(in_->currentLocation());
  Owner<Expression> expr;
  Token tok;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  Location defLoc;
  unsigned defPart;
  if(interp_->defaultLanguageSet(defPart, defLoc)
     && defPart <= interp_->currentPartIndex()) {
    if(defPart == interp_->currentPartIndex()) {
      interp_->setNextLocation(loc);
      message(InterpreterMessages::duplicateDefLangDecl, defLoc);
    }
  }
  else
    interp_->setDefaultLanguage(expr, interp_->currentPartIndex(), loc);
  return 1;
}

bool SchemeParser::doDefineLanguage()
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  Identifier::SyntacticKey key;
  if (ident->syntacticKey(key) && (key <= int(Identifier::lastSyntacticKey)))
    message(InterpreterMessages::syntacticKeywordAsVariable,
            StringMessageArg(currentToken_));
  Location defLoc;
  unsigned defPart;
  if (ident->defined(defPart, defLoc)
      && defPart <= interp_->currentPartIndex()) {
    if (defPart == interp_->currentPartIndex()) {
      message(InterpreterMessages::duplicateDefinition,
              StringMessageArg(ident->name()),
              defLoc);
      return 0;
    }
  }
  lang_ = new (*interp_) LangObj;
  for (;;) {
    if (!getToken(allowOpenParen|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    if (!getToken(allowIdentifier, tok))
      return 0;
    const Identifier *ident = lookup(currentToken_);
    Identifier::SyntacticKey key;
    if (!ident->syntacticKey(key))
      return 0;
    else {
      switch (key) {
      case Identifier::keyCollate:
        if (!doCollate())
          return 0;
        break;
      case Identifier::keyToupper:
        if (!doToupper())
          return 0;
        break;
      case Identifier::keyTolower:
        if (!doTolower())
          return 0;
        break;
      default:
        return 0;
      }
    }
  }
  if (!lang_->compile())
    return 0;
  interp_->makePermanent(lang_);
  Owner<Expression> expr;
  expr = new ConstantExpression(lang_, in_->currentLocation());
  lang_ = 0;
  ident->setDefinition(expr, interp_->currentPartIndex(), loc);
  return 1;
}

bool SchemeParser::doCollate()
{
  Token tok;
  for (;;) {
    if (!getToken(allowOpenParen|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    if (!getToken(allowIdentifier, tok))
      return 0;
    const Identifier *ident = lookup(currentToken_);
    Identifier::SyntacticKey key;
    if (!ident->syntacticKey(key)) {
      return 0;
    } else {
      switch (key) {
      case Identifier::keyElement:
        if (!doMultiCollatingElement())
          return 0;
        break;
      case Identifier::keySymbol:
        if (!doCollatingSymbol())
          return 0;
        break;
      case Identifier::keyOrder:
        if (!doCollatingOrder())
          return 0;
        break;
      default:
        return 0;
      }
    }
  }
  return 1;
}

bool SchemeParser::doMultiCollatingElement()
{
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  StringC sym(currentToken_);
  if (!getToken(allowString, tok))
    return 0;
  StringC str(currentToken_);
  if (!getToken(allowCloseParen, tok))
    return 0;
  lang_->addMultiCollatingElement(sym, str);
  return 1;
}

bool SchemeParser::doCollatingSymbol()
{
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  StringC sym(currentToken_);
  if (!getToken(allowCloseParen, tok))
    return 0;
  lang_->addCollatingSymbol(sym);
  return 1;
}

bool SchemeParser::doCollatingOrder()
{
  Token tok;
  if (!getToken(allowOpenParen, tok))
    return 0;
  int nested = 0;
  LangObj::LevelSort sort = { 0, 0, 0};
  for (;;) {
    if (!getToken(((nested == 0) ? allowOpenParen : 0)|
                  allowCloseParen|allowIdentifier, tok))
      return 0;
    if (tok == tokenOpenParen)
      nested++;
    else if (tok == tokenCloseParen)
      nested--;
    else {
      const Identifier *ident = lookup(currentToken_);
      Identifier::SyntacticKey key;
      if (!ident->syntacticKey(key))
        return 0;
      switch (key) {
        case Identifier::keyForward:
          if (sort.backward)
            return 0;
          sort.forward = 1;
          break;
        case Identifier::keyBackward:
          if (sort.forward)
            return 0;
          sort.backward = 1;
          break;
        case Identifier::keyPosition:
          sort.position = 1;
          break;
        default:
          return 0;
        }
      }
    if (nested < 0)
      break;
    if (nested == 0) {
      if (!sort.backward)
        sort.forward = 1;
      lang_->addLevel(sort);
    }
  }
  for (;;) {
    if (!getToken(allowOpenParen|
                  allowCloseParen|
                  allowIdentifier|
                  allowOtherExpr, tok))
      return 0;
    if (tok == tokenCloseParen)
      break;
    StringC empty;
    switch (tok) {
    case tokenTrue:
      lang_->addDefaultPos();
      for(Char i = 0; i < lang_->levels(); i++)
        lang_->addLevelWeight(i, empty);
      break;
    case tokenIdentifier:
    case tokenChar:
       if (!lang_->addCollatingPos(currentToken_))
        return 0;
      for (unsigned i = 0; i < lang_->levels(); i++)
        lang_->addLevelWeight(i, currentToken_);
      break;
    case tokenOpenParen:
      if (!doWeights())
        return 0;
      break;
    default:
      return 0;
    }
  }
  return 1;
}

bool SchemeParser::doWeights()
{
  Token tok;
  if (!getToken(allowIdentifier|allowOtherExpr, tok))
    return 0;
  StringC sym(currentToken_);
  if (!lang_->addCollatingPos(sym))
    return 0;
  int nested = 0;
  unsigned l = 0;
  for (;;) {
    if (!getToken((nested ? 0 : allowOpenParen)|
                  allowCloseParen|
                  allowIdentifier|
                  allowOtherExpr|
                  allowString, tok))
      return 0;
    if (tok == tokenOpenParen)
      nested++;
    else if (tok == tokenCloseParen)
      nested--;
    else {
      switch (tok) {
      case tokenString:
         for (size_t i = 0; i < currentToken_.size(); i++) {
          StringC ctok(&(currentToken_[i]), 1);
          if (!lang_->addLevelWeight(l, ctok))
            return 0;
        }
        break;
      case tokenIdentifier:
      case tokenChar:
        if (!lang_->addLevelWeight(l, currentToken_))
          return 0;
        break;
      default:
        return 0;
      }
    }
    if (nested < 0)
      break;
    if (nested == 0)
      l++;
  }
  return 1;
}

bool SchemeParser::doToupper()
{
  Token tok;
  for (;;) {
    if (!getToken(allowOpenParen|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen) break;
    if (!getToken(allowOtherExpr, tok) || (tok != tokenChar))
      return 0;
    Char lc = currentToken_[0];
    if (!getToken(allowOtherExpr, tok) || (tok != tokenChar))
      return 0;
    Char uc = currentToken_[0];
    if (!getToken(allowCloseParen, tok))
      return 0;
    lang_->addToupper(lc, uc);
  }
  return 1;
}

bool SchemeParser::doTolower()
{
  Token tok;
  for (;;) {
    if (!getToken(allowOpenParen|allowCloseParen, tok))
      return 0;
    if (tok == tokenCloseParen) break;
    if (!getToken(allowOtherExpr, tok) || (tok != tokenChar))
      return 0;
    Char uc = currentToken_[0];
    if (!getToken(allowOtherExpr, tok) || (tok != tokenChar))
      return 0;
    Char lc = currentToken_[0];
    if (!getToken(allowCloseParen, tok))
      return 0;
    lang_->addTolower(uc, lc);
  }
  return 1;
}

bool SchemeParser::parseSpecialQuery(Owner<Expression> &rexp, const char *query)
{
  Location loc(in_->currentLocation());
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Vector<const Identifier *> vars;
  vars.push_back(lookup(currentToken_));
  Identifier::SyntacticKey key;
  if (vars.back()->syntacticKey(key) && key <= int(Identifier::lastSyntacticKey))
    message(InterpreterMessages::syntacticKeywordAsVariable,
            StringMessageArg(currentToken_));

  Owner<Expression> op(new ConstantExpression(
    interp_->lookup(interp_->makeStringC(query))->computeBuiltinValue(1, *interp_),
    loc));
  NCVector<Owner<Expression> > inits, args(2);
  Owner<Expression> expr;
  if (!parseExpression(0, args[1], key, tok)
      || !parseExpression(0, expr, key, tok)
      || !getToken(allowCloseParen, tok))
    return 0;
  args[0] = new LambdaExpression(vars, inits, 0, 0, 0, expr, loc);
  rexp = new CallExpression(op, args, loc);
  return 1;
}

bool SchemeParser::doDeclareCharProperty()
{
  Token tok;
  if (!getToken(allowIdentifier, tok))
    return 0;
  Identifier *ident = lookup(currentToken_);
  Owner<Expression> expr;
  Identifier::SyntacticKey key;
  if (!parseExpression(0, expr, key, tok))
    return 0;
  if (!getToken(allowCloseParen, tok))
    return 0;
  interp_->addCharProperty(ident, expr);
  return 1;
}

bool SchemeParser::doAddCharProperties()
{
  NCVector<Owner<Expression> > exprs;
  Vector<const Identifier *> keys;
  Token tok;
  for (;;) {
    if (!getToken(allowKeyword|allowOtherExpr, tok))
      return 0;
    if (tok!=tokenKeyword)
      break;
    keys.push_back(lookup(currentToken_));
    exprs.resize(exprs.size() + 1);
    Identifier::SyntacticKey key;
    if (!parseExpression(0, exprs.back(), key, tok))
      return 0;
  }
  
  for(;;) {
    if (tok!=tokenChar) {
      message(InterpreterMessages::badAddCharProperty);
      return 0;
    }
    for (size_t j = 0; j < keys.size(); j++) 
      interp_->setCharProperty(keys[j], currentToken_[0], exprs[j]);
    if(!getToken(allowOtherExpr|allowCloseParen, tok))
      return 0;
    if (tok==tokenCloseParen)
      break;
  }
  return 1;
}


#ifdef DSSSL_NAMESPACE
}
#endif
