#!/bin/zsh

# list sample names from vcf files

cd /Volumes/Brumfield_Lab_Drive/River_islands/1_analysis/vcf_files_final_all_snps/

for i in *.vcf ; do echo $i ; bcftools query -l $i ; done
