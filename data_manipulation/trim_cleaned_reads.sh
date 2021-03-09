#!/bin/sh

READS=2000000
for species in cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus
do
	for dir in /Volumes/Brumfield_Lab_Drive/data/${species}/2_clean_reads/*;
	do
	        RAND=$RANDOM;
	        echo $RAND;
	        mkdir $dir/reads_not_subsampled/
	        for file in $dir/split-adapter-quality-trimmed/*-READ[1-2]*;
	        do
	                echo $file;
	                seqtk sample -s $RAND $file $READS | gzip > $file.SUBSAMPLE.fastq.gz
	                mv $file $dir/reads_not_subsampled/
	                mv $file.SUBSAMPLE.fastq.gz $file
	        done;        
	done;
done
