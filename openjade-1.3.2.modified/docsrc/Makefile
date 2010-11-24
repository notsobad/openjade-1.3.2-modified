MAX_TEX_RECURSION=4
JADE=openjade
JADETEX=jadetex
PDFJADETEX=pdfjadetex
XMLDECL=/usr/share/sgml/xml.dcl

MAN_PAGES=openjade.1

all: $(MAN_PAGES) releasenotes.pdf releasenotes.html releasenotes.ps

%.tex: %.xml %.dsl
	$(JADE) -v -t tex -V tex-backend -d $*.dsl#print $(XMLDECL) $*.xml

%.pdf: %.tex
	$(PDFJADETEX) $<
	if ! cmp $(shell basename $< .tex).aux prior.aux 2>/dev/null && \
		expr $(MAKELEVEL) '<' $(MAX_TEX_RECURSION); then \
		cp -pf $(shell basename $< .tex).aux prior.aux ; \
		rm -f $@ ; \
		$(MAKE) $@ ; \
	fi
	rm -f prior.aux

%.dvi: %.tex
	$(JADETEX) $<
	if ! cmp $(shell basename $< .tex).aux prior.aux 2>/dev/null && \
		expr $(MAKELEVEL) '<' $(MAX_TEX_RECURSION); then \
		cp -pf $(shell basename $< .tex).aux prior.aux ; \
		rm -f $@ ; \
		$(MAKE) $@ ; \
	fi
	rm -f prior.aux

%.ps: %.pdf
	acroread -toPostScript -pairs $< $@

%.html: %.xml %.dsl
	$(JADE) -v -t sgml -i html -V nochunks -V rootchunk -V "%root-filename%=$*" -V "%html-ext%=.html" -d $*.dsl#html $(XMLDECL) $*.xml

%.1: %.xml
	xmlto man -x /usr/share/xmlto/xsl/db2man/docbook.xsl $*.xml
   
clean:
	-rm -f *.out *.aux *.log *.dvi *.tex

realclean: clean
	-rm -f *.html *.pdf $(MAN_PAGES) *.ps
