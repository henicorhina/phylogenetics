#!/bin/sh

cd /Volumes/Brumfield_Lab_Drive/data/1_analysis/vcf_files_final_random_snp-for_geno_conversion/ 

# conbic_full to conbic
vcftools --vcf conirostrum_bicolor_full_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --keep 1_sample_names/conirostrum_bicolor.txt --recode --out conirostrum_bicolor_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf stigmatura_napensis_full_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --keep 1_sample_names/stigmatura_napensis.txt --recode --out stigmatura_napensis_SNPs_phased_rmIndels_75_QC_DP_random
: '
#furmin_full to furmin
vcftools --vcf furnarius_minor_full_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv furnarius_minor_43_LSU42939 --remove-indv furnarius_minor_44_Goeldi16304 --recode --out furnarius_minor_SNPs_phased_rmIndels_75_QC_DP_random

# stinap_full to stinap
vcftools --vcf stigmatura_napensis_full_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv stigmatura_napensis_127_LSU43079 --remove-indv stigmatura_napensis_131_UFPE_T1017 --recode --out stigmatura_napensis_full_SNPs_phased_rmIndels_75_QC_DP_random


vcftools --vcf Glaucidium_brasilianum_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv Glaucidium_brasilianum_LSUMNS48547b --recode --out Glaucidium_brasilianum_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf Hylophylax_punctulata_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv Hylophylax_punctulata_MPEG14398 --recode --out Hylophylax_punctulata_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf ochthornis_littoralis_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv ochthornis_littoralis_108_COP964 --remove-indv ochthornis_littoralis_170_LSU40723 --recode --out ochthornis_littoralis_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf serpophaga_hypoleuca_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv serpophaga_hypoleuca_119_LSU74789 --recode --out serpophaga_hypoleuca_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf Piaya_melanogaster_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv Piaya_melanogaster_USNMB14512 --recode --out Piaya_melanogaster_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf Schiffornis_major_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv Schiffornis_major_MPEG15841 --recode --out Schiffornis_major_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf mazaria_propinqua_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv mazaria_propinqua_133_LSU75947 --recode --out mazaria_propinqua_SNPs_phased_rmIndels_75_QC_DP_random

vcftools --vcf myrmochanes_hemileucus_BAD_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf --remove-indv myrmochanes_hemileucus_78_LSU43093 --recode --out myrmochanes_hemileucus_SNPs_phased_rmIndels_75_QC_DP_random
'
mv *_BAD_* 1_with_contaminated_individuals/