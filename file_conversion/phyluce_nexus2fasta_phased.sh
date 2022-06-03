#!/bin/bash

source activate phyluce

cd /Volumes/Brumfield_Lab_Drive/data/2_phasing/

# already done: conbic myrmotherula_klagesi stigmatura_full stigmatura 
for species in conmar cranioleuca dendroplex elaenia furnarius knipolegus leucippus mazaria myrmoborus myrmochanes myrmotherula_assimilis ochthornis serpophaga thamnophilus ; do

	phyluce_align_convert_one_align_to_another \
	--alignments ${species}-phased-mafft-nexus-edge-trimmed-clean/ \
	--output ${species}-phased-mafft-fasta-edge-trimmed-clean/ \
	--input-format nexus \
	--output-format fasta \
	--cores 2 \
	--log-path log_${species}

done

source deactivate phyluce

