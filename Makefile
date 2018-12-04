
.SUFFIXES : .pdf .tex .zip

LATEX=xelatex
CP_TARGET=$(HOME)/Desktop # Somewhere to copy the output for convenience

TEXINPUTS := ${TEXINPUTS}:`pwd`/..

TEXFILES = $(wildcard ../*.tex)

ZIPS = mydocument.zip

PDFS = mydocument.pdf

pdfs: $(PDFS)

zips: $(ZIPS)

%.pdf: %.tex
	$(LATEX) $*
	bibtex	$*
	$(LATEX) $*
	$(LATEX) $*
	cp $*.pdf $(CP_TARGET)


%.zip: %.tex
	$(LATEX) $*
	bibtex	$*
	$(LATEX) $*
	$(LATEX) $*
	zip $* $*.pdf


clean:
	rm -f  *.dvi *.toc *.bbl *.log *.aux *.blg *~ sblock.75.ps\
               *.lof *.fff *.lot *.out *.zip *.pdf *.bak

spotless: clean
#	cd figs; $(MAKE) spotless
	rm -f  sblock.ps sblock.75.ps *.lof *.fff  *.out *.pdf
