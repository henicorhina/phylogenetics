#!/bin/bash

for f in /Volumes/Brumfield_Lab_Drive/data/2_itero/3_itero_assembly/batch-1-assembly/* ; do
cp -r ${f}/iter-final/iter-4.all-fasta.fasta \
/Volumes/Brumfield_Lab_Drive/data/2_itero/3_itero_assembly/contigs/${f}.contigs.fasta
done
