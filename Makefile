CHAPTERS=Chapter-*/Chapter-*.tex
NAME=thesis
AUX=$(NAME).aux front.aux Chapter-*/*.aux optional.aux
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).lof $(NAME).lot \
              $(NAME).log $(NAME).toc

$(NAME).pdf : $(NAME).tex $(NAME).bib front.tex $(CHAPTERS) ncsuthesis.cls optional.tex
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)

clean :
	rm -f $(AUX) $(INTERMEDIATES) $(NAME).pdf

view :
	evince $(NAME).pdf &

edit:
	vim $(CHAPTERS) thesis.bib thesis.tex front.tex
