library("phytools", lib.loc="/Library/Frameworks/R.framework/Versions/3.4/Resources/library")
tree <- read.tree("/Volumes/Brumfield_Lab_Drive/mike_data/mitogenomes/raxml_mtDNA/Crypturellus/RAxML_bipartitions.Crypturellus_mtdna_final_trimmed.tre")
setwd("/Volumes/Brumfield_Lab_Drive/mike_data/mitogenomes/raxml_mtDNA/Crypturellus_variegatus")
tree$tip.label
pr.species <- c(tree$tip.label[11:16])
cryvar_tree.noPR<-drop.tip(tree,pr.species)
write.tree(cryvar_tree.noPR, file = "RAxML_bipartitions.Crypturellus_variegatus_mtdna_final_trimmed_EDITED.tre")
