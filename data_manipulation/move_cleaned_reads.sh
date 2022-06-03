#!/bin/sh

# this is all unecessary. I can just use rsync exclude

for species in conirostrum_margaritae conirostrum_bicolor cranioleuca_vulpecula dendroplex_kienerii elaenia_pelzelni furnarius_minor knipolegus_orenocensis leucippus_chlorocercus mazaria_propinqua myrmoborus_lugubris myrmochanes_hemileucus myrmotherula_assimilis myrmotherula_klagesi ochthornis_littoralis serpophaga_hypoleuca stigmatura_napensis thamnophilus;
do
	mkdir /Volumes/Brumfield_Lab_Drive/data/by_species/${species}/2_clean_reads_untrimmed
	rsync -a --include '*/' --exclude '*' "/Volumes/Brumfield_Lab_Drive/data/by_species/${species}/2_clean_reads/" "/Volumes/Brumfield_Lab_Drive/data/by_species/${species}/2_clean_reads_untrimmed/"
	for dir in /Volumes/Brumfield_Lab_Drive/data/by_species/${species}/2_clean_reads/*;
	do
		rsync -a reads_not_subsampled/ /Volumes/Brumfield_Lab_Drive/data/by_species/${species}/2_clean_reads_untrimmed/reads_not_subsampled/
	done;
done

rsync -a --include '*/' --exclude '*' "/Volumes/Brumfield_Lab_Drive/data/by_species/conirostrum_bicolor/2_clean_reads/" "/Volumes/Brumfield_Lab_Drive/data/by_species/conirostrum_bicolor/2_cleaned_reads_untrimmed/"

rsync -a reads_not_subsampled/ /Volumes/Brumfield_Lab_Drive/data/by_species/conirostrum_bicolor/2_cleaned_reads_untrimmed/reads_not_subsampled/
rsync -a --stats --progress --exclude 'reads_not_subsampled' conirostrum_bicolor_10_LSU43023/ /Volumes/Brumfield_Lab_Drive/data/by_species/conirostrum_bicolor/2_cleaned_reads_untrimmed/conirostrum_bicolor_10_LSU43023/

reads_not_subsampled