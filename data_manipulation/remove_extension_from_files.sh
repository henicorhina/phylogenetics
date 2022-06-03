#!/bin/sh

cd /Volumes/Brumfield_Lab_Drive/mike_data/mitogenomes/MITOS2_fastas_PCG_only/ 

for file in *.txt; do mv "$file" "${file%%.txt}"; done
