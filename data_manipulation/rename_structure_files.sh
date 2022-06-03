#!/bin/sh
for species in conirostrum_bicolor conirostrum_bicolor_full conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii ; do
	cd /Volumes/Brumfield_Lab_Drive/data/1_analysis/structure_all_snps_run1/${species}/
	echo $species; 
		for i in {1..6}; do	
			mv ${species}_structure_all_snps_run${i}_f ${species}_structure_all_snps_K${i}_replicate1_f
		done;
done
