#!/bin/sh


for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus
do

	cd /Volumes/Brumfield_Lab_Drive/data/${species}/no_outgroup/12_raw-alignments/
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd
	
	cd /Volumes/Brumfield_Lab_Drive/data/${species}/no_outgroup/13_processed-phylip/
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd

	cd /Volumes/Brumfield_Lab_Drive/data/${species}/12_raw-alignments/
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd

	cd /Volumes/Brumfield_Lab_Drive/data/${species}/13_processed-phylip/
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd
	
	cd /Volumes/Brumfield_Lab_Drive/data/${species}/14_formatted_output/gphocs/ 
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd

	cd /Volumes/Brumfield_Lab_Drive/data/${species}/no_outgroup/14_formatted_output/gphocs/ 
	find . -type f -print0 | LC_ALL=C xargs -0 sed -i "" 's/_R_//g'
	pwd

done

