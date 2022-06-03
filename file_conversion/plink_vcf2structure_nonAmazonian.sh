#!/bin/bash



cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/vcf_files_final_all_snps/

vcftools --vcf Campephilus_melanoleucos_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Campephilus_melanoleucos_LSUMNS28535 --recode \
	--out Campephilus_melanoleucos_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Cantorchilus_leucotis_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Cantorchilus_leucotis_LSUMNS34792 --recode \
	--out Cantorchilus_leucotis_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Formicarius_analis_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Formicarius_analis_LSUMNS16533 --recode \
	--out Formicarius_analis_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Formicarius_colma_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Formicarius_colma_MPEG14939 --recode \
	--out Formicarius_colma_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Glaucidium_brasilianum_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Glaucidium_brasilianum_FMNH392464 --remove-indv Glaucidium_brasilianum_LSUMNS48547a --remove-indv Glaucidium_brasilianum_LSUMNS48547b --recode \
	--out Glaucidium_brasilianum_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Megascops_choliba_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Megascops_choliba_MPEG6986 --remove-indv Megascops_choliba_UWBM116721 --recode \
	--out Megascops_choliba_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Monasa_nigrifrons_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Monasa_nigrifrons_MPEG15519 --recode \
	--out Monasa_nigrifrons_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Pheugopedius_coraya_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Pheugopedius_genibarbis_MPEG13470 --recode \
	--out Pheugopedius_coraya_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Piaya_cayana_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Piaya_cayana_LSUMNS72132 --remove-indv Piaya_cayana_MPEG15020 --recode \
	--out Piaya_cayana_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Pipra_erythrocephala_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Pipra_mentalis_LSUMNS16080 --remove-indv Pipra_rubrocapilla_FMNH427182 --recode \
	--out Pipra_erythrocephala_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Saltator_coerulescens_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Saltator_coerulescens_KU3038 --remove-indv Saltator_coerulescens_KU9321 --recode \
	--out Saltator_coerulescens_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Saltator_grossus_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Saltator_grossus_USNMB01287 --recode \
	--out Saltator_grossus_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Schiffornis_turdina_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Schiffornis_turdina_LSUMNS9883 --remove-indv Schiffornis_turdina_MPEG13422 --recode \
	--out Schiffornis_turdina_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Tachyphonus_cristatus_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Tachyphonus_cristatus_MPEG12736 --recode \
	--out Tachyphonus_cristatus_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Tachyphonus_luctuosus_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Tachyphonus_luctuosus_LSUMNS28793 --recode \
	--out Tachyphonus_luctuosus_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Trogon_collaris_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Trogon_collaris_LSUMNS72110 --recode \
	--out Trogon_collaris_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

vcftools --vcf Trogon_rufus_SNPs_phased_rmIndels_75_QC_DP.recode.vcf \
	--remove-indv Trogon_rufus_KU239 --remove-indv Trogon_rufus_LSUMNS26564 --recode \
	--out Trogon_rufus_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly

mv *.log 1_log/


cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/vcf_files_final_random_snp/

vcftools --vcf Campephilus_melanoleucos_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Campephilus_melanoleucos_LSUMNS28535 --recode \
	--out Campephilus_melanoleucos_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Cantorchilus_leucotis_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Cantorchilus_leucotis_LSUMNS34792 --recode \
	--out Cantorchilus_leucotis_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Formicarius_analis_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Formicarius_analis_LSUMNS16533 --recode \
	--out Formicarius_analis_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Formicarius_colma_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Formicarius_colma_MPEG14939 --recode \
	--out Formicarius_colma_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Glaucidium_brasilianum_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Glaucidium_brasilianum_FMNH392464 --remove-indv Glaucidium_brasilianum_LSUMNS48547a --remove-indv Glaucidium_brasilianum_LSUMNS48547b --recode \
	--out Glaucidium_brasilianum_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Megascops_choliba_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Megascops_choliba_MPEG6986 --remove-indv Megascops_choliba_UWBM116721 --recode \
	--out Megascops_choliba_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Monasa_nigrifrons_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Monasa_nigrifrons_MPEG15519 --recode \
	--out Monasa_nigrifrons_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Pheugopedius_coraya_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Pheugopedius_genibarbis_MPEG13470 --recode \
	--out Pheugopedius_coraya_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Piaya_cayana_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Piaya_cayana_LSUMNS72132 --remove-indv Piaya_cayana_MPEG15020 --recode \
	--out Piaya_cayana_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Pipra_erythrocephala_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Pipra_mentalis_LSUMNS16080 --remove-indv Pipra_rubrocapilla_FMNH427182 --recode \
	--out Pipra_erythrocephala_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Saltator_coerulescens_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Saltator_coerulescens_KU3038 --remove-indv Saltator_coerulescens_KU9321 --recode \
	--out Saltator_coerulescens_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Saltator_grossus_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Saltator_grossus_USNMB01287 --recode \
	--out Saltator_grossus_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Schiffornis_turdina_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Schiffornis_turdina_LSUMNS9883 --remove-indv Schiffornis_turdina_MPEG13422 --recode \
	--out Schiffornis_turdina_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Tachyphonus_cristatus_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Tachyphonus_cristatus_MPEG12736 --recode \
	--out Tachyphonus_cristatus_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Tachyphonus_luctuosus_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Tachyphonus_luctuosus_LSUMNS28793 --recode \
	--out Tachyphonus_luctuosus_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Trogon_collaris_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Trogon_collaris_LSUMNS72110 --recode \
	--out Trogon_collaris_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

vcftools --vcf Trogon_rufus_SNPs_phased_rmIndels_75_QC_DP_random.recode.vcf \
	--remove-indv Trogon_rufus_KU239 --remove-indv Trogon_rufus_LSUMNS26564 --recode \
	--out Trogon_rufus_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly

mv *.log 1_log/




cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/
#: '
for species in Campephilus_melanoleucos Cantorchilus_leucotis Formicarius_analis Formicarius_colma Glaucidium_brasilianum Megascops_choliba Monasa_nigrifrons Pheugopedius_coraya Piaya_cayana Pipra_erythrocephala Saltator_coerulescens Saltator_grossus Schiffornis_turdina Tachyphonus_cristatus Tachyphonus_luctuosus Trogon_collaris Trogon_rufus ; do

: '
	plink \
		--vcf vcf_files_final_all_snps/${species}_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly.recode.vcf \
		--recode structure --biallelic-only --const-fid --allow-extra-chr --allow-no-sex \
		--set-missing-var-ids @:# \
		--out structure_files_plink_converter/${species}_structure.AmazonOnly.str

done

cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/structure_files_plink_converter/
mv *.log 1_log/
mv *.nosex 1_log/

for i in $( ls *.recode.strct_in.str ); do mv $i ${i%.*}; done
'

conda activate python2

cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/

for species in Campephilus_melanoleucos Cantorchilus_leucotis Formicarius_analis Formicarius_colma Glaucidium_brasilianum Megascops_choliba Monasa_nigrifrons Pheugopedius_coraya Piaya_cayana Pipra_erythrocephala Saltator_coerulescens Saltator_grossus Schiffornis_turdina Tachyphonus_cristatus Tachyphonus_luctuosus Trogon_collaris Trogon_rufus ; do

	# all SNPs
	python /Users/harveylab/Applications/misc_python-master/bin/STRUCTURE/structure_from_vcf.py \
		vcf_files_final_all_snps/${species}_SNPs_phased_rmIndels_75_QC_DP.AmazonOnly.recode.vcf \
		structure_files_seqcap_pop_all_snps/${species}_SNPs_phased_rmIndels_75_QC_DP_seqcap_pop_structure.AmazonOnly.str

# random SNP per locus
	python /Users/harveylab/Applications/misc_python-master/bin/STRUCTURE/structure_from_vcf.py \
		vcf_files_final_random_snp/${species}_SNPs_phased_rmIndels_75_QC_DP_random.AmazonOnly.recode.vcf \
		structure_files_seqcap_pop_random_snp/${species}_SNPs_phased_rmIndels_75_QC_DP_random_seqcap_pop_structure.AmazonOnly.str

done

conda deactivate
