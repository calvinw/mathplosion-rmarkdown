SOURCES=$(shell find . -name "*.Rmd")
HTML_FILES = $(SOURCES:%.Rmd=%.html)
PDF_FILES = $(SOURCES:%.Rmd=%.pdf)
export PATH := /bin:/usr/bin:/opt/R/3.4.4/lib/R/bin:$(PATH) 

all : $(HTML_FILES) $(PDF_FILES)
	@echo All files are now up to date
	touch changed.txt

clean : 
	@echo Removing html files...	
	rm -f $(HTML_FILES) 
	@echo Removing pdf files...	
	rm -f $(PDF_FILES) 

allFiles:
	find -name '*.Rmd' | sort > allFiles 

%.html : %.Rmd
	@echo Calling render for html...	
	Rscript -e 'rmarkdown::render("$<", "html_document")'

%.pdf : %.Rmd
	@echo Calling render for pdf...	
	Rscript -e 'rmarkdown::render("$<", "pdf_document")'

sync:
	@echo Starting sync server...	
	npx browser-sync start --config=bs-config.js

watchlive: 
	make -j watch live

live:
	@echo Starting live reload server...	
	node app.js	
		
watch:
	@echo Watching .Rmd files...	
	@echo Will call make on changes...	
	while true; do ls *.Rmd | entr make; done

.PHONY: all allpdf clean live watch watchlive allFiles
