# edit path
setwd('/Volumes/Brumfield_Lab_Drive/mike_data/UCE_coverage/')

# import uce coverage data
all = read.csv('all_samples_all_species_UCE_loci_04_11_2019.csv', header = TRUE)

# mean coverage across all uces
print(mean(all[ , c('coverage')]))

# list of all samples in the dataset
samples <- unique(all[ ,c('sample')])

# filter out low-coverage contigs based on contaminated mtdna data
all_filtered <- all[all$coverage >= 5.45 & all$node_type == 'uce', ]

print("number of contigs removed from all: ")
print(nrow(all)-nrow(all_filtered))


# write per-lane and overall filtered uce contigs to csv
write.csv(all_filtered, file = "all_samples_clean_loci_filtered.csv")

# extract contaminated loci

all_contam <- all[all$coverage <= 5.45 & all$node_type == 'uce', ]

write.csv(all_contam, file = "all_samples_contaminated_loci.csv")

