// This file was automatically generated from InterpreterMessages.msg by msggen.pl.
#ifndef InterpreterMessages_INCLUDED
#define InterpreterMessages_INCLUDED 1

#ifdef __GNUG__
#pragma interface
#endif
#include <OpenSP/Message.h>

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

struct InterpreterMessages {
  // 0
  static const MessageType0 unexpectedEof;
  // 1
  static const MessageType0 invalidChar;
  // 2
  static const MessageType0 unknownHash;
  // 3
  static const MessageType1 unknownNamedConstant;
  // 4
  static const MessageType1 unexpectedToken;
  // 5
  static const MessageType0 unterminatedString;
  // 6
  static const MessageType0 missingCloseParen;
  // 7
  static const MessageType1 invalidNumber;
  // 8
  static const MessageType1 invalidAfiiGlyphId;
  // 9
  static const MessageType1 callNonFunction;
  // 10
  static const MessageType0 tooManyArgs;
  // 11
  static const MessageType0 oddKeyArgs;
  // 12
  static const MessageType0 missingArg;
  // 13
  static const MessageType1 syntacticKeywordAsVariable;
  // 14
  static const MessageType1 undefinedVariableReference;
  // 15
  static const MessageType1 badCharName;
  // 16
  static const MessageType1 keywordNotAllowedCall;
  // 17
  static const MessageType1 symbolRequired;
  // 18
  static const MessageType1 unknownTopLevelForm;
  // 19
  static const MessageType1 badModeForm;
  // 20
  static const MessageType1L duplicateDefinition;
  // 22
  static const MessageType1 identifierLoop;
  // 23
  static const MessageType0 outOfRange;
  // 24
  static const MessageType1 unitLoop;
  // 25
  static const MessageType1 badUnitDefinition;
  // 26
  static const MessageType1L duplicateUnitDefinition;
  // 28
  static const MessageType1 undefinedQuantity;
  // 29
  static const MessageType0 incompatibleDimensions;
  // 30
  static const MessageType3 notABoolean;
  // 31
  static const MessageType3 notAPair;
  // 32
  static const MessageType3 notAList;
  // 33
  static const MessageType3 notASymbol;
  // 34
  static const MessageType3 notAString;
  // 35
  static const MessageType3 notAStringOrSymbol;
  // 36
  static const MessageType3 notASymbolOrString;
  // 37
  static const MessageType3 notAChar;
  // 38
  static const MessageType3 notATimeString;
  // 39
  static const MessageType3 notAStyle;
  // 40
  static const MessageType3 notAnExactInteger;
  // 41
  static const MessageType3 notAQuantity;
  // 42
  static const MessageType3 notAColorSpace;
  // 43
  static const MessageType3 notANumber;
  // 44
  static const MessageType3 notASosofo;
  // 45
  static const MessageType3 notAnOptSingletonNode;
  // 46
  static const MessageType3 notASingletonNode;
  // 47
  static const MessageType3 notANodeList;
  // 48
  static const MessageType3 notANamedNodeList;
  // 49
  static const MessageType3 notALengthSpec;
  // 50
  static const MessageType3 notAQuantityOrLengthSpec;
  // 51
  static const MessageType3 notAPriority;
  // 52
  static const MessageType3 notAPattern;
  // 53
  static const MessageType3 notAnAddress;
  // 54
  static const MessageType3 notAGlyphId;
  // 55
  static const MessageType3 notAGlyphSubstTable;
  // 56
  static const MessageType3 notAGlyphIdPairList;
  // 57
  static const MessageType3 notAProcedure;
  // 58
  static const MessageType3 notAVector;
  // 59
  static const MessageType0L duplicateRootRule;
  // 61
  static const MessageType1L duplicateInitialValue;
  // 63
  static const MessageType1 invalidStyleKeyword;
  // 64
  static const MessageType2 invalidMakeKeyword;
  // 65
  static const MessageType1 unknownFlowObjectClass;
  // 66
  static const MessageType1 atomicContent;
  // 67
  static const MessageType0 labelNotASymbol;
  // 68
  static const MessageType1 badConnection;
  // 69
  static const MessageType0 badContentMap;
  // 70
  static const MessageType1 contentMapBadPort;
  // 71
  static const MessageType1 invalidCharacteristicValue;
  // 72
  static const MessageType0 condFail;
  // 73
  static const MessageType1 caseFail;
  // 74
  static const MessageType1 caseElse;
  // 75
  static const MessageType0 caseUnresolvedQuantities;
  // 76
  static const MessageType1 errorProc;
  // 77
  static const MessageType0 divideBy0;
  // 78
  static const MessageType1 invalidKeyArg;
  // 79
  static const MessageType0 keyArgsNotKey;
  // 80
  static const MessageType0 oneBody;
  // 81
  static const MessageType0 specNotArc;
  // 82
  static const MessageType0 noStyleSpec;
  // 83
  static const MessageType1 unknownCharName;
  // 84
  static const MessageType0 noCurrentNode;
  // 85
  static const MessageType0 noCurrentProcessingMode;
  // 86
  static const MessageType0 invalidRadix;
  // 87
  static const MessageType0 sosofoContext;
  // 88
  static const MessageType0 styleContext;
  // 89
  static const MessageType0 notInCharacteristicValue;
  // 90
  static const MessageType1 expressionNotImplemented;
  // 91
  static const MessageType1 colorArgCount;
  // 92
  static const MessageType1 colorArgType;
  // 93
  static const MessageType1 colorArgRange;
  // 94
  static const MessageType1 colorProcResType;
  // 95
  static const MessageType1 unknownColorSpaceFamily;
  // 96
  static const MessageType1 colorSpaceNoArgs;
  // 97
  static const MessageType1 colorSpaceArgError;
  // 98
  static const MessageType1 notABuiltinInheritedC;
  // 99
  static const MessageType1 invalidNumberFormat;
  // 100
  static const MessageType1 invalidPublicIdChar;
  // 101
  static const MessageType1 debug;
  // 102
  static const MessageType0 useLoop;
  // 103
  static const MessageType1 missingPart;
  // 104
  static const MessageType0 noParts;
  // 105
  static const MessageType0 tableCellOutsideTable;
  // 106
  static const MessageType0 tableRowOutsideTable;
  // 107
  static const MessageType1 noNodePropertyValue;
  // 108
  static const MessageType0 returnNotNodeList;
  // 109
  static const MessageType0 stackTrace;
  // 110
  static const MessageType1 stackTraceEllipsis;
  // 111
  static const MessageType0 processNodeLoop;
  // 112
  static const MessageType0 spliceNotList;
  // 113
  static const MessageType0 readOnly;
  // 114
  static const MessageType1 topLevelAssignment;
  // 115
  static const MessageType0 continuationDead;
  // 116
  static const MessageType0 patternEmptyGi;
  // 117
  static const MessageType0 patternNotList;
  // 118
  static const MessageType1 patternBadGi;
  // 119
  static const MessageType1 patternBadMember;
  // 120
  static const MessageType0 patternMissingQualifierValue;
  // 121
  static const MessageType1 patternUnknownQualifier;
  // 122
  static const MessageType2 patternBadQualifierValue;
  // 123
  static const MessageType0 patternChildRepeat;
  // 124
  static const MessageType0 patternBadAttributeQualifier;
  // 125
  static const MessageType1L ambiguousStyle;
  // 127
  static const MessageType0 ambiguousMatch;
  // 128
  static const MessageType1 uninitializedVariableReference;
  // 129
  static const MessageType1 actualLoop;
  // 130
  static const MessageType1L duplicateCharacteristic;
  // 132
  static const MessageType1L duplicateFlowObjectClass;
  // 134
  static const MessageType1 undefinedMode;
  // 135
  static const MessageType1 duplicateCharName;
  // 136
  static const MessageType1 duplicateSdataEntityName;
  // 137
  static const MessageType1 duplicateSdataEntityText;
  // 138
  static const MessageType0 unsupportedDeclaration;
  // 139
  static const MessageType1 unsupportedCharRepertoire;
  // 140
  static const MessageType0 badDeclaration;
  // 141
  static const MessageType1 duplicateDeclaration;
  // 142
  static const MessageType1 invalidIdentifier;
  // 143
  static const MessageType0 badLanguageDefinition;
  // 144
  static const MessageType0 noCurrentLanguage;
  // 145
  static const MessageType3 notALanguage;
  // 146
  static const MessageType3 notAPositiveInteger;
  // 147
  static const MessageType3 notAnInteger;
  // 148
  static const MessageType3 notAKeyword;
  // 149
  static const MessageType3 notAnAlist;
  // 150
  static const MessageType3 notACharList;
  // 151
  static const MessageType3 lengthError;
  // 152
  static const MessageType1 noExactRepresentation;
  // 153
  static const MessageType0L duplicateDefLangDecl;
  // 155
  static const MessageType1 defLangDeclRequiresLanguage;
  // 156
  static const MessageType1 invalidUnitName;
  // 157
  static const MessageType1 invalidCharName;
  // 158
  static const MessageType1 invalidCharNumber;
  // 159
  static const MessageType1 unknownCharProperty;
  // 160
  static const MessageType0 badAddCharProperty;
  // 161
  static const MessageType1L duplicateCharPropertyDecl;
  // 163
  static const MessageType2 duplicateAddCharProperty;
  // 164
  static const MessageType0 returnNotSosofo;
  // 165
  static const MessageType0 varCharPropertyExprUnsupported;
};

#ifdef SP_NAMESPACE
}
#endif

#endif /* not InterpreterMessages_INCLUDED */
