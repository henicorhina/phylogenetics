#!/bin/sh

for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus ; do

cp /Volumes/Brumfield_Lab_Drive/data/by_species_take2/${species}/8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP.recode.vcf /Volumes/Brumfield_Lab_Drive/data/1_analysis/vcf_files_final_all_snps/${species}_SNPs_phased_rmIndels_75_QC_DP.recode.vcf

done

for species in Campephilus_melanoleucos Campephilus_rubricollis Cantorchilus_leucotis Celeus_flavus Celeus_grammicus Crypturellus_undulatus Crypturellus_variegatus Formicarius_analis Formicarius_colma Glaucidium_brasilianum Glaucidium_hardyi Hylophylax_naevia Hylophylax_punctulata Megascops_choliba Megascops_watsonii Monasa_morphoeus Monasa_nigrifrons Myrmeciza_fortis Myrmeciza_hyperythra Myrmoborus_leucophrys Myrmoborus_myotherinus Phaethornis_bourcieri Phaethornis_hispidus Pheugopedius_coraya Piaya_cayana Piaya_melanogaster Pipra_erythrocephala Pipra_filicauda Saltator_coerulescens Saltator_grossus Schiffornis_major Schiffornis_turdina Synallaxis_gujanensis Synallaxis_rutilans Tachyphonus_cristatus Tachyphonus_luctuosus Trogon_collaris Trogon_rufus Xiphorhynchus_elegans Xiphorhynchus_obsoletus ; do

cp /Volumes/Brumfield_Lab_Drive/mike_data/6_seqcap_pop/${species}/8_GATK/${species}_SNPs_phased_rmIndels_75_QC_DP.recode.vcf /Volumes/Brumfield_Lab_Drive/data/1_analysis/vcf_files_final_all_snps/${species}_SNPs_phased_rmIndels_75_QC_DP.recode.vcf

done

