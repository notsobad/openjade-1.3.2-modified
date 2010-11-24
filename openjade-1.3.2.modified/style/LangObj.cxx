// Copyright (c) 1998, 1999 Matthias Clasen
// See the file copying.txt for copying permission.

#include "stylelib.h"
#include "LangObj.h"
#include "HashTable.h"
#include "CharMap.h"
#include "constant.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <string.h>

#ifdef SP_HAVE_LOCALE
#ifdef SP_HAVE_WCHAR
#include <wchar.h>
#include <wctype.h>
#include <locale.h>
#endif
#endif

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

#ifdef SP_HAVE_LOCALE
#ifdef SP_HAVE_WCHAR
# ifndef __GLIBC__
static char *strdup(const char *s)
{
  size_t l = strlen(s) + 1;
  return (char *) memcpy ((char *) malloc (sizeof (char) * l), s, l);
}
# endif /* __GLIBC__ */

static char *stringify(const StringC &s)
{
  char *r = (char *) malloc (sizeof(char)*(s.size() + 1));
  for (size_t i = 0; i < s.size(); i++) 
    r[i] = char(s[i]);
  r[s.size()] = 0;
  return r;
}

// FIXME this is unneeded if SP_WCHAR_IS_USHORT
static wchar_t *wchartify(const StringC &s)
{
  wchar_t *r = (wchar_t *) malloc (sizeof(wchar_t)*(s.size() + 1));
  for (size_t i = 0; i < s.size(); i++) 
    r[i] = wchar_t(s[i]);
  r[s.size()] = 0;
  return r;
}

char *RefLangObj::localeName(const StringC &lang, const StringC &country)
{
  char *p;

  p = (char *) malloc (sizeof(char)*(lang.size() + country.size() + 2));
  size_t i;
  for (i = 0; i < lang.size(); i++)
    p[i] = tolower(char(lang[i]));
  p[i++] = '_';
  for (size_t j = 0; j < country.size(); j++, i++)
    p[i] = toupper(char(country[j]));
  p[i] = 0;
  return p;
}

bool RefLangObj::supportedLanguage(const StringC &lang, const StringC &country)
{
  char *p = RefLangObj::localeName(lang, country);
  char *old = strdup(setlocale(LC_ALL, 0));
  bool res = (setlocale(LC_ALL, p) != 0);
  setlocale(LC_ALL, old);
  free (p); free (old);
  return res;
}

RefLangObj::RefLangObj(const StringC &lang, const StringC &country) 
{
  char *p = localeName(lang, country);
  oldLocale_ = strdup(setlocale(LC_ALL, 0));  
  newLocale_ = strdup(setlocale(LC_ALL, p));
  free (p);
}

RefLangObj::~RefLangObj() 
{
  free (oldLocale_);
  free (newLocale_);
}

LanguageObj *RefLangObj::asLanguage()
{
  return this;
}

Char RefLangObj::toUpper(const Char c) const
{
  setlocale(LC_ALL, newLocale_);  
  Char uc = towupper(c);
  setlocale(LC_ALL, oldLocale_);  
  return uc;
}

Char RefLangObj::toLower(const Char c) const
{
  setlocale(LC_ALL, newLocale_);  
  Char lc = towlower(c);
  setlocale(LC_ALL, oldLocale_);  
  return lc;
}

bool RefLangObj::areEquivalent(const StringC &r, const StringC &s, 
			       const Char l) const
{
  setlocale(LC_ALL, newLocale_);  
  wchar_t *rr = wchartify(r);
  unsigned rn = wcsxfrm (0, rr, 0);
  wchar_t *rx = (wchar_t *) malloc (sizeof(wchar_t)*rn); 
  wcsxfrm(rx, rr, rn);
  wchar_t *ss = wchartify(s);
  unsigned sn = wcsxfrm (0, ss, 0);
  wchar_t *sx = (wchar_t *) malloc (sizeof(wchar_t)*sn);
  wcsxfrm(sx, ss, sn);
  bool res;
  unsigned k = 0;
  for (unsigned i = 0; ; i++) {
    if (rx[i] != sx[i]) { res = 0; break; } 
    if (rx[i] == 1) k++;
    if (k == l || rx[i] == 0) { res = 1; break; } 
  }
  free (rr); free (ss); free (rx); free (sx); 
  setlocale(LC_ALL, oldLocale_);  
  return res;
}

bool RefLangObj::isLess(const StringC &r, const StringC &s) const
{
  setlocale(LC_ALL, newLocale_);  
  wchar_t *rr = wchartify(r);
  wchar_t *ss = wchartify(s);
  int res = wcscoll(rr, ss);
  free (rr); free (ss);
  setlocale(LC_ALL, oldLocale_);  
  return (res < 0);
}

bool RefLangObj::isLessOrEqual(const StringC &r, const StringC &s) const
{
  setlocale(LC_ALL, newLocale_);  
  wchar_t *rr = wchartify(r);
  wchar_t *ss = wchartify(s);
  int res = wcscoll(rr, ss);
  free (rr); free (ss);
  setlocale(LC_ALL, oldLocale_);  
  return (res <= 0);
}
#endif /* SP_HAVE_WCHAR */
#endif /* SP_HAVE_LOCALE */

class LangBuildData {
public:
  LangBuildData() : currentpos(0) {};
  HashTable<StringC, StringC> order;
  Char currentpos;
  HashTable<StringC, StringC> ce; 
  HashTable<StringC, Char> syms;  
};
  
  class LangData {
  public:
    LangData();
    LangObj::LevelSort level[20]; // FIXME  
    Char levels;
    HashTable<StringC, StringC> weights;   
    HashTable<StringC, Char> collate; 
    CharMap<Char> toupper;
    CharMap<Char> tolower;
  };

LangData::LangData() 
{
  toupper.setAll(charMax);
  tolower.setAll(charMax);
  levels = 0;
}

void LangObj::addMultiCollatingElement(const StringC &sym, 
                                           const StringC &str)
{
  buildData_->ce.insert(sym, str); 
}

void LangObj::addCollatingSymbol(const StringC &sym)
{
  buildData_->syms.insert(sym, charMax); 
}

void LangObj::addLevel(const LevelSort &sort) 
{
  data_->level[data_->levels++] = sort;
}

void LangObj::addDefaultPos()
{
  StringC empty;
  addCollatingPos(empty);
}

bool LangObj::addCollatingPos(const StringC &sym)
{
  if (!buildData_->ce.lookup(sym) && !buildData_->syms.lookup(sym)) 
    if (sym.size() <= 1) 
      buildData_->ce.insert(sym, sym);
    else 
      return 0;
  buildData_->order.insert(StringC(&buildData_->currentpos, 1), sym);
  buildData_->currentpos++;
  return 1;
}

bool LangObj::addLevelWeight(const Char l, const StringC &w)
{
  if (!buildData_->ce.lookup(w) && !buildData_->syms.lookup(w)) 
    if (w.size() <= 1) 
      buildData_->ce.insert(w, w); 
    else 
      return 0;
  StringC key;
  key.resize(3);
  key[0] = buildData_->currentpos - 1;
  key[1] = l;
  for (key[2] = 0; buildData_->order.lookup(key); key[2]++) ; 
  buildData_->order.insert(key, w);
  return 1;
}

void LangObj::addToupper(const Char lc, const Char uc)
{
  data_->toupper.setChar(lc, uc);
}

void LangObj::addTolower(const Char uc, const Char lc)
{
  data_->tolower.setChar(uc, lc);
}

LangObj::LangObj() 
{
  buildData_ = new LangBuildData;
  data_ = new LangData;
}

LangObj::~LangObj()
{
  if (buildData_) delete buildData_;
  if (data_) delete data_;
}

bool LangObj::compile()
{
  const Char *col;
  StringC key, val, data;
  StringC empty;
  const StringC *match, *match2;

  data_->collate.insert(empty, buildData_->currentpos); 
  key.resize(1);
  for (key[0] = 0; key[0] < buildData_->currentpos; key[0]++) {
    match = buildData_->order.lookup(key);
    if (match == 0) 
      return 0;
    match2 = buildData_->ce.lookup(*match);
    if (match2 == 0) 
      buildData_->syms.insert(*match, key[0]);
    else  
      data_->collate.insert(*match2, key[0]);
  }
  key.resize(2);
  data.resize(3);
  for (data[0] = 0; data[0] < buildData_->currentpos; data[0]++) {
    key[0] = data[0];
    for (data[1] = 0; data[1] < levels(); data[1]++) {
      key[1] = data[1];
      val.resize(0);
      for (data[2] = 0; buildData_->order.lookup(data); data[2]++) {
        match = buildData_->order.lookup(data);
	if (match == 0) 
	  return 0;
	match2 = buildData_->ce.lookup(*match);
	if (match2 == 0) 
	  col = buildData_->syms.lookup(*match);
	else 
	  col = data_->collate.lookup(*match2);
	if (col == 0)  
	  return 0;
	val += *col;
      }
      data_->weights.insert(key, val);
     }
  }
  delete buildData_;
  buildData_ = 0;
  return 1;
}

LanguageObj *LangObj::asLanguage()
{
  return this;
}

bool LangObj::areEquivalent(const StringC &r, const StringC &s,
				const Char k) const
{
  return (compare(r, s, k) == 0);
}

int LangObj::compare(const StringC &rr, const StringC &ss, 
			 const Char k) const
{
  StringC rc = asCollatingElts(rr);
  StringC sc = asCollatingElts(ss);
 
  for (Char l = 0; (l < k) && (l < levels()); l++) {
    StringC r = atLevel(rc, l);
    StringC s = atLevel(sc, l);
    for (size_t i = 0; (i < r.size()) || (i < s.size()); i++) {
      if (i == r.size()) return -1;
      if (i == s.size()) return 1;
      if (r[i] < s[i]) return -1;
      if (r[i] > s[i]) return 1;
    }
  }
  return 0;
}

StringC LangObj::asCollatingElts(const StringC &s) const
{
  StringC res, key, empty;
  unsigned i, j;
  int col;
  const Char *c, *def;
  Char def_val;

  def = data_->collate.lookup(empty); 
  def_val = (def == 0) ? charMax : *def;  
  for (i = 0; i < s.size(); i = j) {
    col = def_val;
    key = empty;
    for (j = i; j < s.size(); j++) {
      key += s[j]; 
      c = data_->collate.lookup(key);
      if (c == 0) 
        break;
      col = *c;
    }
    if (i == j) 
      // if we get here, s[j] is a single `unknown' char and 
      // we better not reconsider it to avoid an infinite loop. 
      j++;
    res += col;
  }
  return res;
}

StringC LangObj::atLevel(const StringC &s, const Char l) const
{
  StringC cols, res, key;
  const StringC *w;

  if (data_->level[l].backward) 
    for (int i = s.size() - 1; i >= 0; i--) 
      cols += s[i];
  else 
    cols = s;
  key.resize(2);
  key[1] = l;
  for (size_t i = 0; i < cols.size(); i++) {
    key[0] = cols[i];
    w = data_->weights.lookup(key);
    if (w == 0) 
      return res;
    if (data_->level[l].backward) 
      for (int j = w->size() - 1; j >= 0; j--) {
	if (data_->level[l].position) 
          res += i; 
	res += (*w)[j]; 
      }
    else  // forward
      for (int j = 0; j < w->size(); j++) {
	if (data_->level[l].position) 
          res += i; 
	res += (*w)[j]; 
      }
  }
  return res;
}

Char LangObj::toUpper(const Char c) const
{
  Char uc = data_->toupper[c];
  return (uc == charMax) ? c : uc;
}

Char LangObj::toLower(const Char c) const
{
  Char lc = data_->tolower[c];
  return (lc == charMax) ? c : lc;
}

unsigned LangObj::levels() const
{
  return data_->levels;
}

bool LangObj::isLess(const StringC &r, const StringC &s) const
{
  return (compare(r, s, levels()) < 0);
}

bool LangObj::isLessOrEqual(const StringC &r, const StringC &s) const
{
  return (compare(r, s, levels()) <= 0);
}

#ifdef DSSSL_NAMESPACE
}
#endif

/*

Notes on the LangObj class:

All data is in the classes LanguageData and 
LanguageBuildData. The LanguageBuildData is only
needed until we call LanguageObj::compile() and
is freed afterwards.

Once a LangObj is built, we use the functions isLess(), 
isLessOrEqual(), toUpper(), toLower() and areEquivalent()
to implement the language-dependent functions of the
expression language. 

The LangBuildData stores a map symbols --> strings
for multi-collating-elements (ce) and a second map
positions --> symbols (order). These are incrementally 
filled up while parsing a define-language expression.
order also stores a map 

  positions x levels x weight-numbers --> weights 

(there may be more than one weight for a given position 
and level). The empty string is used as key for the 
default entry in syms.

Compilation is done in two phases: In the first phase,
we build the syms and collate maps (syms maps
symbols --> positions and collate maps 
multi-collating-elements --> positions). This is achived
by inverting the corresponding part of order.

In the next phase, the weights map is built. It maps
positions x levels x weight-numbers --> positions.

Comparing two string works in three phases: First, 
the strings are converted to positions (done by 
asCollatingElts()), then we are comparing one level
at a time. For this, the strings of positions are
converted into strings of weights. How this is done
depends on the level.
Finally the strings of weights are lexicographically
compared.

Notes on the RefLangObj class:

It uses the underlying POSIX locale system and wchar_t. At least
with GNU libc, wchar_t is always encoded as ISO-10646 UCS4, thus 
the Char and wchar_t codes of a character have the same value. But
since sizeof(wchar_t) = 4 != 2 = sizeof(Char), we have to do ugly 
conversions (at least on i386-linux-glibc2) to be able to use the 
libc wide character routines wcscoll() and wcsxfrm(). 

To create a language by reference to a locale, use the external
procedure with pubid UNREGISTERED::OpenJade//Procedure::language 

(language lang country)

where lang and country are symbols or strings like the ones used 
for the language: and country: characteristics of the paragraph FO. 
If the locale is not supported, language returns #f. If Jade is 
compiled without locale support (!SP_HAVE_LOCALE) language *always* 
returns #f.

The implementation of string-equiv? depends on the fact that
wcsxfrm() returns a 0-terminated string of integers where the 
substrings for each level are separated by 1. This is true for
glibc, but I don't know if it is universally true.

*/
