#!/bin/bash

echo "Watching all *.Rmd files"
echo "and running make when they change" 
ls *.Rmd | entr make
