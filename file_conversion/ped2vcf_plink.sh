#!/bin/bash


#cd /Volumes/TOSHIBA\ EXT/RAD.SNAKES/WORKING.FOLDER/
cd /Users/harveylab/Documents/Snakes
plink \
--file ddRAD.SNAKES.5253Acat \
--allow-no-sex \
--recode vcf \
--out ddRAD_SNAKES_5253Acat
