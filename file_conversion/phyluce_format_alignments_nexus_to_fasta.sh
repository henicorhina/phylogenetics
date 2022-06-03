#!/bin/sh


 
for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus
do

	# convert locus alignments from phylip to nexus
	phyluce_align_convert_one_align_to_another \
	--alignments ${species}/no_outgroup/13_processed_nexus/ \
	--output ${species}/no_outgroup/13_processed_fasta/ \
	--input-format nexus \
	--output-format fasta \
	--cores 4

done	

for species in conirostrum_bicolor conirostrum_margaritae cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus thamnophilus_cryptoleucus thamnophilus_nigrocinereus
do

	# convert locus alignments from phylip to nexus
	phyluce_align_convert_one_align_to_another \
	--alignments ${species}/13_processed_nexus/ \
	--output ${species}/13_processed_fasta/ \
	--input-format nexus \
	--output-format fasta \
	--cores 4

done


for species in conirostrum_bicolor ochthornis_littoralis stigmatura_napensis
do

	# convert locus alignments from phylip to nexus
	phyluce_align_convert_one_align_to_another \
	--alignments ${species}/no_outgroup_full/13_processed_nexus/ \
	--output ${species}/no_outgroup_full/13_processed_fasta/ \
	--input-format nexus \
	--output-format fasta \
	--cores 4

done	

