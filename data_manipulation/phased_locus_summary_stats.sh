#!/bin/bash

source activate python2

for dir in /Volumes/Brumfield_Lab_Drive/data/2_phasing/2_complete-taxon-set/1_cleaned_alignments-fasta-no_outgroups/*/ ; do
	cd $dir
	echo $dir
	for i in *.fasta; do phyluce_assembly_get_fasta_lengths --input $i --csv ; done
done 

source deactivate