#!/bin/bash

# no contaminated loci: conirostrum_bicolor_66_UFPE_T1161 knipolegus_orenocensis_48_MPEG_T15658 myrmotherula_klagesi_100_INPA_A15925 stigmatura_napensis_T766
for species in conirostrum_margaritae_15_LSU93298 cranioleuca_vulpecula_19_LSU25424 dendroplex_kienerii_26_LSU80430 elaenia_pelzelni_35_LSU7249 furnarius_minor_42_LSU7265 leucippus_chlorocercus_63_LSU43036 mazaria_propinqua_UFPE_5254 myrmoborus_lugubris_71_MPEG_T22926 myrmochanes_hemileucus_81_MPEG_T22712 myrmotherula_assimilis_243_MPEG_T22595 ochthornis_littoralis_102_LSU81242 serpophaga_hypoleuca_T122 thamnophilus_cryptoleucus_144_LSU93318 thamnophilus_nigrocinereus_151_INPA_A10843 ; do
	echo "${species}"
	while read p; do
		grep "${p}" /Volumes/Brumfield_Lab_Drive/data/1_spades_coverage/3_spades_assembly_uces_only/${species}_spades/contigs.fasta
	done </Volumes/Brumfield_Lab_Drive/data/1_contamination/contaminated_uce_loci/contaminated_uce_loci_${species}.txt ; 
done