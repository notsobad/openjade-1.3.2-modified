// Copyright (c) 1998, 1999 Matthias Clasen
// See the file copying.txt for copying permission.

#ifndef LangObj_INCLUDED
#define LangObj_INCLUDED 1

#include "config.h"
#include "ELObj.h"

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

class LanguageObj : public ELObj {
public:
  virtual Char toUpper(const Char) const = 0;
  virtual Char toLower(const Char) const = 0;
  virtual bool areEquivalent(const StringC &, const StringC &, const Char) const = 0;
  virtual bool isLess(const StringC &, const StringC &) const = 0;
  virtual bool isLessOrEqual(const StringC &, const StringC &) const = 0;
};

#ifdef SP_HAVE_LOCALE
#ifdef SP_HAVE_WCHAR
class RefLangObj : public LanguageObj {
 public:
  static bool supportedLanguage(const StringC &, const StringC &);
  RefLangObj(const StringC &, const StringC &);
  ~RefLangObj();

  void *operator new(size_t, Collector &c) {
    return c.allocateObject(1);
  }
  LanguageObj *asLanguage();

  Char toUpper(const Char) const;
  Char toLower(const Char) const;
  bool areEquivalent(const StringC &, const StringC &, const Char) const;
  bool isLess(const StringC &, const StringC &) const;
  bool isLessOrEqual(const StringC &, const StringC &) const;
 private:
  static char *localeName(const StringC &, const StringC &);
  char *oldLocale_;
  char *newLocale_;
};
#endif /* SP_HAVE_WCHAR */
#endif /* SP_HAVE_LOCALE */ 

class LangBuildData;
class LangData;

class LangObj : public LanguageObj {
 public:
  struct LevelSort {
    unsigned int forward  :1;
    unsigned int backward :1;
    unsigned int position :1;
  };

  LangObj();
  ~LangObj();
  void *operator new(size_t, Collector &c) {
    return c.allocateObject(1);
  }
  LanguageObj *asLanguage();
  unsigned levels() const;

  Char toUpper(const Char) const;
  Char toLower(const Char) const;
  bool areEquivalent(const StringC &, const StringC &, const Char) const;
  bool isLess(const StringC &, const StringC &) const;
  bool isLessOrEqual(const StringC &, const StringC &) const;

 private:
  void addMultiCollatingElement(const StringC &, const StringC &);
  void addCollatingSymbol(const StringC &);
  void addLevel(const LevelSort &);
  void addDefaultPos();
  bool addCollatingPos(const StringC &);
  bool addLevelWeight(const Char, const StringC &);
  void addToupper(const Char, const Char);
  void addTolower(const Char, const Char);

  bool compile();

  int compare(const StringC &, const StringC &, const Char) const;
  StringC asCollatingElts(const StringC &) const;
  StringC atLevel(const StringC &, const Char) const;

  LangBuildData *buildData_;
  LangData *data_;
  friend class SchemeParser;
};

#ifdef DSSSL_NAMESPACE
}
#endif

#endif /* not LangObj_INCLUDED */
