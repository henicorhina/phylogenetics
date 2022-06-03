#!/bin/sh

: '
cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/

for s in conbic conbic_full conmar cranioleuca dendroplex elaenia furnarius knipolegus knipolegus_full leucippus mazaria myrmoborus myrmochanes myrmotherula_assimilis myrmotherula_klagesi ochthornis serpophaga stigmatura stigmatura_full thamnophilus ; do 
	cd ${s}-phased-mafft-nexus-edge-trimmed-clean-nooutgroup
	grep -o '^[^ ]*' uce-5.nexus > ${s}_sample_names.txt
	mv ${s}_sample_names.txt /Volumes/Brumfield_Lab_Drive/data/2_phasing/1_sample_names/
	cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/
done
'


cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/

for s in conbic_full  ; do 
	cd ${s}-phased-mafft-nexus-edge-trimmed-clean-nooutgroup
	grep -o '^[^ ]*' uce-5.nexus > ${s}_sample_names.txt
	mv ${s}_sample_names.txt /Volumes/Brumfield_Lab_Drive/data/2_phasing/1_sample_names/
	cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/
done

