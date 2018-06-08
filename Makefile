SOURCES=$(shell find . -name "*.Rmd")
HTML_FILES = $(SOURCES:%.Rmd=%.html)
export PATH := /usr/bin:/opt/R/3.4.4/lib/R/bin:$(PATH) 

all : $(HTML_FILES)
	@echo All files are now up to date

clean : 
	@echo Removing html files...	
	rm -f $(HTML_FILES) 

%.html : %.Rmd
	@echo Calling render...	
	Rscript -e 'rmarkdown::render("$<")'

#%.html : %.Rmd
#	@echo Calling render...	
#	Rscript -e 'knitr::knit2html("$<", force_v1 = TRUE)'

refresh: 
	./refreshChrome.sh

server:
	@echo Starting server...	
	python -m SimpleHTTPServer 4000

watch:
	@echo Watching .Rmd files...	
	@echo Will make and refresh Chrome on changes...	
	ls Test.Rmd | entr -csp 'make && ./refreshChrome.sh'
