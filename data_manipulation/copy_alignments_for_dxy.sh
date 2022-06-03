#!/bin/bash

for species in  conbic conmar cranioleuca dendroplex elaenia furnarius furnarius_full knipolegus_full leucippus mazaria myrmoborus myrmochanes myrmotherula_assimilis myrmotherula_klagesi ochthornis serpophaga stigmatura_full thamnophilus ; do 
cp -r ${species}-phased-mafft-nexus-untrimmed-complete-clean-nooutgroup /Volumes/Brumfield_Lab_Drive/data/1_analysis/dxy_fst_final/
done
