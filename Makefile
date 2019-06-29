SOURCES=$(shell find . -name "*.Rmd")
HTML_FILES = $(SOURCES:%.Rmd=%.html)
export PATH := /bin:/usr/bin:/opt/R/3.4.4/lib/R/bin:$(PATH) 

all : $(HTML_FILES)
	@echo All files are now up to date

clean : 
	@echo Removing html files...	
	rm -f $(HTML_FILES) 

allFiles:
	find -name '*.Rmd' | sort > allFiles 

%.html : %.Rmd
	@echo Calling render...	
	Rscript -e 'rmarkdown::render("$<")'
	@echo render is finished...	
	echo $@ | nc -q .01 localhost 4000

sync:
	@echo Starting sync server...	
	npx browser-sync start --config=bs-config.js

watchlive: 
	make -j watch live

live:
	@echo Starting node server...	
	node app.js	
		
watch:
	@echo Watching .Rmd files...	
	@echo Will call make on changes...	
	while true; do ls *.Rmd | entr make; done
#ls *.Rmd | entr -csp make 

.PHONY: all clean live watch watchlive allFiles
