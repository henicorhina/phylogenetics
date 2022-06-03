#!/bin/sh

for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus
do
	cd /Volumes/Brumfield_Lab_Drive/data/by_species_take2/${species}/
	rm 14_formatted_output/structure/*
	rm 14_formatted_output/faststructure/*
	rm 14_formatted_output/adegenet/*
	rm 14_formatted_output/genepop/*


# structure

python /Users/mharvey/seqcap_pop-master/bin/structure_from_vcf.py \
	8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	14_formatted_output/structure/${species}_SNPs_phased_rmIndels_75_QC_DP_random_STRUCTURE.txt
	
	
# faststructure

python /Users/mharvey/seqcap_pop-master/bin/faststructure_from_vcf.py \
	8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	14_formatted_output/faststructure/ \
	${species}_SNPs_phased_rmIndels_75_QC_DP_random \
	--all


# adegenet

python /Users/mharvey/seqcap_pop-master/bin/adegenet_from_vcf.py \
	8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	14_formatted_output/adegenet/ \
	${species}_SNPs_phased_rmIndels_75_QC_DP_random \
	--all


# genepop

python /Users/mharvey/seqcap_pop-master/bin/genepop_from_vcf.py \
	8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	14_formatted_output/genepop/ \
	${species}_SNPs_phased_rmIndels_75_QC_DP_random \
	--all

done