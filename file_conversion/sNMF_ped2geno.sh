#!/bin/bash

cd /Volumes/Brumfield_Lab_Drive/data/1_analysis/ 

#for species in Campephilus_melanoleucos Campephilus_rubricollis Cantorchilus_leucotis Celeus_flavus Celeus_grammicus conirostrum_bicolor_full conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula Crypturellus_undulatus Crypturellus_variegatus dendroplex_kienerii elaenia_pelzelni Formicarius_analis Formicarius_colma furnarius_minor_full furnarius_minor Glaucidium_brasilianum Glaucidium_hardyi Hylophylax_naevia Hylophylax_punctulata knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua Megascops_choliba Megascops_watsonii Monasa_morphoeus Monasa_nigrifrons Myrmeciza_fortis Myrmeciza_hyperythra Myrmoborus_leucophrys myrmoborus_lugubris Myrmoborus_myotherinus myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis Phaethornis_bourcieri Phaethornis_hispidus Pheugopedius_coraya Piaya_cayana Piaya_melanogaster Pipra_erythrocephala Pipra_filicauda Saltator_coerulescens Saltator_grossus Schiffornis_major Schiffornis_turdina serpophaga_hypoleuca stigmatura_napensis_full stigmatura_napensis Synallaxis_gujanensis Synallaxis_rutilans Tachyphonus_cristatus Tachyphonus_luctuosus thamnophilus_cryptoleucus thamnophilus_nigrocinereus thamnophilus Trogon_collaris Trogon_rufus Xiphorhynchus_elegans Xiphorhynchus_obsoletus ; do
for species in conirostrum_bicolor_full furnarius_minor_full stigmatura_napensis_full ; do
	/Users/mharvey/src/sNMF_CL_v1.2/bin/ped2geno \
		plink_ped/${species}_SNPs_phased_random_plink.ped \
		geno_final_random_snp/${species}_SNPs_phased_rmIndels_75_QC_DP_random.geno

done
