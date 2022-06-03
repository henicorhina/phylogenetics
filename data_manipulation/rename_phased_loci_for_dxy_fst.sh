#!/bin/bash

for dir in /Volumes/Brumfield_Lab_Drive/data/1_analysis/dxy_fst/*-phased-mafft-nexus-edge-trimmed-clean-nooutgroup/; do
	cd $dir
	for fname in *.phylip-relaxed; do
    	sed -i.OLD -E "s/_1 /b /" $fname
    	sed -i.OLDER -E "s/_0 /a /" $fname
	done; 
	rm *.nexus.OLD
	rm *.nexus.OLDER
done
	
: '	
	
for fname in *.phylip-relaxed; do
    	sed -i.OLD -E "s/_1 /b /" $fname
    	sed -i.OLDER -E "s/_0 /a /" $fname
done
'