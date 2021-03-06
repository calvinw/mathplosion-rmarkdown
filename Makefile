SHELL:=/bin/bash
SOURCES =$(shell find . -name "*.Rmd")

HTML_FILES = $(SOURCES:%.Rmd=%.html)
HTMLWEBTEX_FILES = $(SOURCES:%.Rmd=%-webtex.html)
PDF_FILES = $(SOURCES:%.Rmd=%.pdf)
DOCX_FILES = $(SOURCES:%.Rmd=%.docx)
# HTMLWEBTEX_FILES =
# PDF_FILES =
# DOCX_FILES =

export PATH :=.:/bin:/usr/bin:$(PATH)

all : $(HTMLWEBTEX_FILES) $(HTML_FILES) $(PDF_FILES) $(DOCX_FILES)
	@echo All files are now up to date

clean :
	@echo Removing html, md, pdf, docx files...	
	rm -f $(HTMLWEBTEX_FILES) $(HTML_FILES) $(PDF_FILES) $(DOCX_FILES)
	rm -rf *_files figure

%.html : %.Rmd
	@Rscript renderRmd.R $< html_document $@

%-webtex.html : %.Rmd
	@Rscript renderRmd.R $< html_document_webtex $@

%.pdf : %.Rmd
	@Rscript renderRmd.R $< pdf_document $@

%.docx : %.Rmd
	@Rscript renderRmd.R $< word_document $@

data: 
	node problems.js > data.json

server:
	make -j watch nodeapp

watch:
	@echo Watching .Rmd files...	
	@echo Will call make on changes...	
	while true; do ls *.Rmd | entr make -j1 SERVER=yes; done

nodeapp: 
	@echo Launching app.js 
	node app.js

.PHONY: all clean
