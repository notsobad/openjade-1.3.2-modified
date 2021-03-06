#
#  Makefile.in - Makefile template for Jade
# 
#  $Id: Makefile.in,v 1.4.4.7 2002/12/01 15:57:32 icastle Exp $
#
#  Copyright (C) 1998 Cees A. de Groot
#

# Original SP Makefile.in Copyright (C) 1996 Henry S. Thompson
# Original SP Makefile Copyright (c) 1994, 1995, 1996 James Clark

SHELL=/bin/bash
top_builddir=/home/wang/script/docbook/openjade-1.3.2
TOP=/home/wang/script/docbook/openjade-1.3.2
prefix=/opt/iscanv/report-tools/
exec_prefix=${prefix}
srcdir=.
bindir=${exec_prefix}/bin
datadir=${prefix}/share
libdir=${exec_prefix}/lib
mandir=${prefix}/man
includedir=${prefix}/include
oldincludedir=/usr/include
spincludedir=/opt/iscanv/report-tools//include/OpenSP
splibdir=/opt/iscanv/report-tools//lib

DESTDIR=

LIBTOOL=$(SHELL) $(top_builddir)/libtool
LIBTOOL_DEPS=config/ltmain.sh

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL}
transform = s,x,x,

mkinstalldirs = $(SHELL) $(TOP)/config/mkinstalldirs
man1dir=$(mandir)/man1

man_MANS = openjade.1

MANS = $(man_MANS)

SP_LIBDIRS=$(splibdir) $(XLIBDIRS)
LIBDIRS=grove spgrove style
PROGDIRS=jade
dodirs=$(LIBDIRS) $(PROGDIRS)

# Automatic template instantiation can cause compilers to generate
# various extra files; the clean target won't delete these.
TARGETS=all install depend gen clean pure 
do=all

$(TARGETS): FORCE
	@$(MAKE) -f Makefile do=$@ $(dodirs)
	@if test $@ = 'install'; then \
	  $(LIBTOOL) --finish $(DESTDIR)$(libdir); \
	  mkdir -p $(DESTDIR)$(datadir); \
	  cp -f dsssl/builtins.dsl $(DESTDIR)$(datadir); \
	fi;

$(LIBDIRS): FORCE
	@if test $(srcdir) = .; \
	then srcdir=.; \
	else srcdir=`cd $(srcdir); pwd`/$@; \
	fi; \
	test -d $@ || mkdir $@; \
	cd $@; \
	test -f $$srcdir/Makefile.dep || touch $$srcdir/Makefile.dep; \
	test -f $$srcdir/Makefile.lt || \
	    $(MAKE) srcdir=$$srcdir VPATH=$$srcdir \
		-f $$srcdir/../Makefile.comm -f $$srcdir/Makefile.sub \
	        -f $$srcdir/../Makefile.lib -f $$srcdir/Makefile.dep \
		Makefile.lt; \
	$(MAKE) srcdir=$$srcdir VPATH=$$srcdir \
		-f $$srcdir/../Makefile.comm -f $$srcdir/Makefile.sub \
		-f $$srcdir/Makefile.lt -f $$srcdir/../Makefile.lib \
		-f $$srcdir/Makefile.dep $(do)

$(PROGDIRS): FORCE
	@if test $(srcdir) = .; \
	then srcdir=.; \
	else srcdir=`cd $(srcdir); pwd`/$@; \
	fi; \
	test -d $@ || mkdir $@; \
	cd $@; \
	test -f $$srcdir/Makefile.dep || touch $$srcdir/Makefile.dep; \
	test -f $$srcdir/Makefile.lt || \
	    $(MAKE) srcdir=$$srcdir VPATH=$$srcdir \
		-f $$srcdir/../Makefile.comm -f $$srcdir/Makefile.sub \
	        -f $$srcdir/../Makefile.prog -f $$srcdir/Makefile.dep \
		Makefile.lt; \
	$(MAKE) srcdir=$$srcdir VPATH=$$srcdir \
		-f $$srcdir/../Makefile.comm -f $$srcdir/Makefile.sub \
		-f $$srcdir/Makefile.lt -f $$srcdir/../Makefile.prog \
		-f $$srcdir/Makefile.dep $(do)

$(PROGDIRS): $(SP_LIBDIRS)

jade: grove spgrove style

spgrove: grove

style: grove spgrove

# GNU tar
TAR=tar

distdir = $(PACKAGE)-$(VERSION)
top_distdir = $(distdir)

dist: FORCE
	cd test; ./CLEAN
	version=`cat VERSION`; \
	rm -fr sp-$$version; \
	mkdir sp-$$version; \
	cd sp-$$version; \
	ln -s ../* .; \
	rm sp-$$version; \
	rm SP.mak ; \
	sed -e '/^   CD /s/[A-Z]:\\.*\\//' -e "s/$$/`echo @ | tr @ \\\\015`/" \
	  ../SP.mak >SP.mak; \
	cd ..; \
	ln -s `pwd` sp-$$version; \
	$(TAR) -c -f sp-$$version.tar.gz -h -z \
	  --exclude sp-$$version/test/cap \
	  --exclude sp-$$version/test/out \
	  --exclude sp-$$version/test/err \
	  `sed -e "s|.*|sp-$$version/&|" FILES`; \
	rm -fr sp-$$version

mrproper:
	-rm -f Makefile Makefile.comm Makefile.lib Makefile.prog \
		config.cache config.log config.status
	-test -f Makefile.dist && mv Makefile.dist Makefile
	-test -f Makefile.comm.dist && mv Makefile.comm.dist Makefile.comm
	-test -f Makefile.prog.dist && mv Makefile.prog.dist Makefile.prog
	-test -f Makefile.lib.dist && mv Makefile.lib.dist Makefile.lib

FORCE:

libtool: $(LIBTOOL_DEPS)
	$(SHELL) ./config.status --recheck

install-man:
	$(mkinstalldirs) $(DESTDIR)$(man1dir)
	@list='$(man1_MANS)'; \
	l2='$(man_MANS)'; for i in $$l2; do \
	  case "$$i" in \
	    *.1*) list="$$list $$i" ;; \
	  esac; \
	done; \
	for i in $$list; do \
	  if test -f $(TOP)/docsrc/$$i; then file=$(TOP)/docsrc/$$i; \
	  else file=$$i; fi; \
	  ext=`echo $$i | sed -e 's/^.*\\.//'`; \
	  inst=`echo $$i | sed -e 's/\\.[0-9a-z]*$$//'`; \
	  inst=`echo $$inst | sed '$(transform)'`.$$ext; \
          echo " $(INSTALL_DATA) $$file $(DESTDIR)$(man1dir)/$$inst"; \
	  $(INSTALL_DATA) $$file $(DESTDIR)$(man1dir)/$$inst; \
	done
