PACKAGE = *.dtx \
		  Lacroux-Bible.pdf \
		  bibleref-french.pdf \
		  bibleref-french-francais.pdf \
		  bibleref-french.ins \
		  bibleref-french.dtx \
		  inclus/* \



.PHONY: all dist clean


all:bibleref-french.sty  bibleref-french-francais.pdf  bibleref-french.pdf dist clean




%.sty: %.ins %.dtx 
	@pdflatex $*.ins

bibleref-french-francais.pdf: bibleref-french-francais.tex inclus/styles.tex inclus/livres.tex
	@pdflatex bibleref-french-francais.tex
	@pdflatex bibleref-french-francais.tex
bibleref-french.pdf:bibleref-french.dtx inclus/styles.tex inclus/livres.tex bibleref-french.sty
	@pdflatex bibleref-french.dtx
	makeindex -s gglo.ist -o bibleref-french.gls bibleref-french.glo
	@pdflatex bibleref-french.dtx
	
dist: $(PACKAGE)
	@$(RM) ../bibleref-french.zip
	zip ../bibleref-french.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc  bibleref-french-francais.pdf bibleref-french.pdf *sty *glo *idx

