.PHONY: clean run show view

LATEXMK=latexmk -lualatex -latexoption=-shell-escape
TARGET=conference_041818
TLK=talk-2020-10-15-aiit

run: $(TARGET).pdf

tlk: $(TLK).pdf

$(TARGET).pdf $(TLK).pdf: %.pdf: %.tex
	$(LATEXMK) $<
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

show: $(TARGET).pdf
	evince $< &

view: show