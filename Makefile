SOURCES=$(shell find . -name "*.Rmd")
HTML_FILES = $(SOURCES:%.Rmd=%.html)

all : $(HTML_FILES)
	@echo All files are now up to date

clean : 
	@echo Removing html files	
	rm -f $(HTML_FILES) 

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<")'
