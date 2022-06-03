#!/bin/sh

for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus ; do
	cd /Volumes/Brumfield_Lab_Drive/data/by_species_take2/${species}/
 	/Users/mharvey/src/plink_mac_20190304/plink  \
	--vcf 8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--make-bed \
	--const-fid \
	--allow-extra-chr \
	--out 14_formatted_output/plink/${species}_SNPs_phased_random
done