#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
if(length(args) !=3) {
    stop("renderRmd: Expected 3 arguments: input output_format output_file");
}

library(knitr)
library(rmarkdown)

input<-args[1]
output_format<-args[2]
output_file<-args[3]

if(output_format == "html_document_webtex") {
    output_format = html_document(mathjax=NULL, 
	  pandoc_args=list("--webtex"))
}

opts_chunk[["set"]](results="hold"); 
opts_knit[["set"]](progress = FALSE); 

render(input, output_format=output_format, output_file=output_file)
