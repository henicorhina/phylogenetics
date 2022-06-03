#!/bin/bash

cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/2_bams/

#---do a few loops
for dir in /Volumes/Brumfield_Lab_Drive/data/2_phasing/2_bams/*-multialign-bams-phased-reads/; do
	cd $dir
	for fname in *.fasta; do
    	NAME=$(basename "$fname" '.fasta')
    	sed -i.OLD -E "s/^>(uce-[0-9]+).*$/>\1_$NAME/" $fname
    	sed -i.OLDER -E "s/^>(uce-[0-9]+)(.*$)/>\1\2 |\1/" $fname
    	#clean up some stuff
    	sed -i -E "s/\.unphased//" $fname
    	sed -i -E "s/\.clean.balanced//" $fname
    	sed -i -E "s/\.clean//" $fname
    	sed -i -E "s/\./_/" $fname
		#rm *.fasta.OLD
		rm *.fasta.OLDER
		rm *.fasta-E
	done; 

	rm fastas/*
	for fname in *.0.clean.balanced.fasta; do cp $fname fastas/$fname; done
	for fname in *.1.clean.balanced.fasta; do cp $fname fastas/$fname; done

	cd ${dir}/fastas/
	python /Volumes/Brumfield_Lab_Drive/data/1_code/1_data_manipulation/interleave_fastas.py *.fasta
done 




: '

for dir in /Volumes/Brumfield_Lab_Drive/data/2_phasing/2_bams/*-multialign-bams-phased-reads/; do
	cd $dir
	#for fname in *.fasta; do sed -i.OLDER -E "s/^>(uce-[0-9]+)(.*$)/>\1\2 |\1/" $fname; done; 
	rm *.fasta.OLDER
done

rm fastas/*
cd fastas

for fname in *.0.clean.balanced.fasta; do ln -s $fname fastas/$fname; done
for fname in *.1.clean.balanced.fasta; do ln -s $fname fastas/$fname; done
'


#/Volumes/Brumfield_Lab_Drive/data/1_code/interleave_fastas.py elaenia_pelzelni_35_LSU7249.0.clean.balanced.fasta elaenia_pelzelni_35_LSU7249.1.clean.balanced.fasta elaenia_pelzelni_36_Goeldi22693.0.clean.balanced.fasta elaenia_pelzelni_36_Goeldi22693.1.clean.balanced.fasta elaenia_ridleyana_MZUSP80416.0.clean.balanced.fasta elaenia_ridleyana_MZUSP80416.1.clean.balanced.fasta elaenia_spectabilis_L42601.0.clean.balanced.fasta elaenia_spectabilis_L42601.1.clean.balanced.fasta
