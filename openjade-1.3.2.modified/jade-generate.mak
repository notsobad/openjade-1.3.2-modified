# This is a Makefile for nmake that makes all the .cxx and .h files that
# are automatically generated.  It's too painful to do in the IDE.
# You'll need perl in your PATH to use this.

PERL=perl

GENSRCS=\
style\style_inst.cxx \
style\FlowObj_inst.cxx \
style\primitive_inst.cxx \
style\common_inst.cxx \
spgrove\grove_inst.cxx \
jade\HtmlFOTBuilder_inst.cxx \
jade\RtfFOTBuilder_inst.cxx \
jade\TeXFOTBuilder_inst.cxx \
jade\MifFOTBuilder_inst.cxx \
jade\TransformFOTBuilder_inst.cxx \
jade\JadeMessages.h \
jade\HtmlMessages.h \
jade\RtfMessages.h \
jade\TeXMessages.h \
jade\MifMessages.h \
style\DssslAppMessages.h \
style\InterpreterMessages.h

.SUFFIXES: .m4 .msg

all: $(GENSRCS)


.m4.cxx:
	del /f $@ 2> nul
	$(PERL) lib\instmac.pl $< >$@
	attrib +r $@

.msg.h:
	del /f $@ 2> nul
	$(PERL) -w msggen.pl $<
	attrib +r $@
