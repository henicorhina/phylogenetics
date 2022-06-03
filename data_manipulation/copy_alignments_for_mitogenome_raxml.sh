#!/bin/bash


cd /Volumes/Brumfield_Lab_Drive/River_islands/mike_data/mitogenomes

for species in Campephilus_melanoleucos Campephilus_rubricollis Cantorchilus_leucotis Celeus_flavus Celeus_grammicus Crypturellus_undulatus Crypturellus_variegatus Formicarius_analis Formicarius_colma Glaucidium_brasilianum Glaucidium_hardyi Hylophylax_naevia Hylophylax_punctulata Megascops_choliba Megascops_watsonii Monasa_morphoeus Monasa_nigrifrons Myrmeciza_fortis Myrmeciza_hyperythra Myrmoborus_leucophrys Myrmoborus_myotherinus Phaethornis_bourcieri Phaethornis_hispidus Pheugopedius_coraya Piaya_cayana Piaya_melanogaster Pipra_erythrocephala Pipra_filicauda Saltator_coerulescens Saltator_grossus Schiffornis_major Schiffornis_turdina Synallaxis_gujanensis Synallaxis_rutilans Tachyphonus_cristatus Tachyphonus_luctuosus Trogon_collaris Trogon_rufus Xiphorhynchus_elegans Xiphorhynchus_obsoletus
do
echo $species
mkdir raxml_mtDNA/${species}/1_unpartitioned
cp PartitionFinder2/${species}/unpartitioned/analysis/best_scheme.txt \
	raxml_mtDNA/${species}/1_unpartitioned/
cp PartitionFinder2/${species}/${species}_Concatenated_alignments.phy \
	raxml_mtDNA/${species}/1_unpartitioned/

done



cd /Volumes/Brumfield_Lab_Drive/River_islands/mitogenomes

for species in Conirostrum Conirostrum_bicolor Conirostrum_margaritae Cranioleuca Dendroplex_lepidocolaptes Dendroplex_picus Elaenia Furnarius Knipolegus_core Knipolegus_full Leucippus Mazaria Myrmoborus Myrmochanes Myrmotherula_assimilis Myrmotherula_klagesi Ochthornis_core Ochthornis_full Serpophaga Stigmatura_core Stigmatura_full thamnophilus
do
echo $species
mkdir raxml_mtDNA/${species}/1_unpartitioned
cp PartitionFinder2/${species}/unpartitioned/analysis/best_scheme.txt \
	raxml_mtDNA/${species}/1_unpartitioned/
cp PartitionFinder2/${species}/${species}_Concatenated_alignments.phy \
	raxml_mtDNA/${species}/1_unpartitioned/

done
