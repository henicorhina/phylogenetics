#!/bin/sh

# this doesn't work


for species in elaenia_pelzelni furnarius_minor leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus thamnophilus_cryptoleucus thamnophilus_nigrocinereus Campephilus_melanoleucos Campephilus_rubricollis Cantorchilus_leucotis Celeus_flavus Celeus_grammicus Crypturellus_undulatus Crypturellus_variegatus Formicarius_analis Formicarius_colma Glaucidium_brasilianum Glaucidium_hardyi Hylophylax_naevia Hylophylax_punctulata Megascops_choliba Megascops_watsonii Monasa_morphoeus Monasa_nigrifrons Myrmeciza_fortis Myrmeciza_hyperythra Myrmoborus_leucophrys Myrmoborus_myotherinus Phaethornis_bourcieri Phaethornis_hispidus Pheugopedius_coraya Piaya_cayana Piaya_melanogaster Pipra_erythrocephala Pipra_filicauda Saltator_coerulescens Saltator_grossus Schiffornis_major Schiffornis_turdina Synallaxis_gujanensis Synallaxis_rutilans Tachyphonus_cristatus Tachyphonus_luctuosus Trogon_collaris Trogon_rufus Xiphorhynchus_elegans Xiphorhynchus_obsoletus ; do
	#sed -i 's/cranioleuca_vulpecula/Tachyphonus_luctuosus/g' dapc_pca_Tachyphonus_luctuosus_copy.R

	sed -i -E "s/cranioleuca_vulpecula/\${species}/g;s/Cranioleuca vulpecula/\${species}/g;s/cravul/\${species}/g" dapc_pca_${species}_copy.R 
	rm *.R-E

done


          
sed -i -E "s/cranioleuca_vulpecula/Schiffornis_turdina/g;s/Cranioleuca vulpecula/Schiffornis turdina/g;s/cravul/Schiffornis_turdina/g" dapc_pca_Schiffornis_turdina.R 
