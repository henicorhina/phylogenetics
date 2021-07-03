#!/usr/bin/env Rscript

# written by Oscar Johnson and Michael Harvey
# divides a tree into subclades based on a divergence time threshold

setwd("/Volumes/Backup_Plus/Tyranni_traits")
getwd()

library(ape)
library(phytools)

tree <- read.tree(file = "trees/T400F_dupsdropped.phy")

# Extract subclades using a time threshold
x <- 8 # threshold in Ma
h <- nodeHeights(tree)
t <- max(h)-x # time from the root
h1 <- which(h[,1] < t) # identify all edges crossing time x
h2 <- which(h[,2] > t)
ii <- intersect(h1, h2)
nodes <- tree$edge[ii,2] # all daughter nodes of those edges

# Write each subclade to a file
nodes <- nodes[nodes > length(tree$tip.label)]
for(i in 1:length(nodes)) {
  subclade <- extract.clade(tree, nodes[i])
  subclade <- force.ultrametric(subclade)
  if(length(subclade$tip.label) > 20) { # adjust value if you want smaller or larger clades
    write.tree(subclade, file = paste0("Subclades/Tree.subclade", i, ".tre"))
  }
  
}

quit()
