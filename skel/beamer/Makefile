slides:
	./convert
	pdflatex -shell-escape slides.tex
	biber slides
	pdflatex -shell-escape slides.tex
	gnome-open slides.pdf
