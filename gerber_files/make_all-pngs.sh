#!/bin/bash

# default DPI value of 300
DPI=${1:-300}

for file in `ls *.g[!v]?`; do
gerbv $file -o ./PNGs/$file.png --dpi=${DPI}x${DPI} -a --export=png
done

for file in `ls *.drl`; do
gerbv $file -o ./PNGs/$file.png --dpi=${DPI}x${DPI} -a --export=png
done

for file in `ls ./gerbv/*.gvp`; do
# replace matching from the beginning of $file
OUTFILE=${file/#.\/*\//.\/PNGs/}
# replace matching from the end of $OUTFILE
OUTFILE=${OUTFILE/%.gvp/.png}
gerbv -p $file -o $OUTFILE --dpi=${DPI}x${DPI} -a --export=png
done

gwenview ./PNGs/* &
