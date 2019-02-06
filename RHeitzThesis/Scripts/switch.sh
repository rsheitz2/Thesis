#!/bin/bash

if [ $# -ne 1 ]; then
     echo "" 
     echo "Switch from full thesis to simple thesis and vise versa"
     echo ""
     echo "Enter final thesis.tex (i.e. \"simple\", \"full\")"
     echo ""
     echo "A copy of the last thesis.tex is in Scripts/tmp.tex"
     echo ""
     
else
    whichFinal=$1
    path="/Users/robertheitz/Documents/Research/DrellYan/Papers/MyPapers/Thesis/RHeitzThesis"

    if [ ${whichFinal} == "simple" ]; then
	cp ${path}/thesis.tex ${path}/Scripts/tmp.tex

	echo "cp thesis.tex thesis_full.tex"
	echo "cp thesis_simple.tex thesis.tex"
	
	cp ${path}/thesis.tex ${path}/thesis_full.tex
	cp ${path}/thesis_simple.tex ${path}/thesis.tex
    elif [ ${whichFinal} == "full" ]; then
	cp ${path}/thesis.tex ${path}/Scripts/tmp.tex

	echo "cp thesis.tex thesis_simple.tex"
	echo "cp thesis_full.tex thesis.tex"
	
	cp ${path}/thesis.tex ${path}/thesis_simple.tex
	cp ${path}/thesis_full.tex ${path}/thesis.tex
    else
	echo "Wrong input"
    fi

fi
