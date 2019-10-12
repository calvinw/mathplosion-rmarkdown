#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
if(length(args) != 2) {
    stop("renderRmd: Expected Rmd filename and format");
}

library(knitr)
library(rmarkdown)

rmdFile<-args[1]
format<-args[2]

opts_chunk[["set"]](results="hold"); 
opts_knit[["set"]](progress = FALSE); 

render(rmdFile, format)