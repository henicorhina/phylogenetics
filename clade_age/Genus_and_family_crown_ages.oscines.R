setwd("/Volumes/Backup_Plus/Tyranni_traits")
getwd()

library(ape)
library(phytools)
library(phangorn)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)

sample.data <- read.delim("Clade_ages/Oscines/doi_10.5061_dryad.pb787__v1/taxon_translations.txt", stringsAsFactors = FALSE)
clements <- read.csv("Clade_ages/Oscines/eBird-Clements-v2019-integrated-checklist-August-2019.9_primaried_oscine.species.csv", stringsAsFactors = FALSE)
tree <- read.tree(file = "Clade_ages/Oscines/doi_10.5061_dryad.pb787__v1/Emberizoid_trees/contree_MCC.phy")


data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}

#-------------------------------------------------------------------------

# data formatting

clements$scientific.name <- gsub(" ", "_", clements$scientific.name)

# remove outgroups # and subspecies
drop.lumps <- as.character(dplyr::filter(sample.data, is.na(clements_category))$tree_taxon)
drop <- c("Oreomystis_bairdii", "Paroreomyza_montana", "Euphonia_laniirostris", "Chlorophonia_flavirostris")
tree <- drop.tip(tree, drop.lumps)
tree <- drop.tip(tree, drop)

write.tree(tree, file = "Clade_ages/Oscines/doi_10.5061_dryad.pb787__v1/Emberizoid_trees/contree_MCC.formatted.tre")


sample.data <- sample.data %>% 
  dplyr::filter(!is.na(clements_category)) %>% 
  dplyr::select(tree_taxon, clements_6_9_name, tree_order)

sample.data <- left_join(sample.data, clements, by = c("tree_taxon" = "scientific.name"))

# manually update to current clements taxonomy
write.csv(sample.data, file = "Clade_ages/Oscines/eBird-Clements-v2019-integrated-checklist-August-2019.9_primaried_oscine.species.temp.csv", row.names = FALSE)


#-------------------------------------------------------------------------

# start from here in the future
sample.data <- read.csv("Clade_ages/Oscines/eBird-Clements-v2019-integrated-checklist-August-2019.9_primaried_oscine.species.temp.csv", stringsAsFactors = FALSE)
tree <- read.tree(file = "Clade_ages/Oscines/doi_10.5061_dryad.pb787__v1/Emberizoid_trees/contree_MCC.formatted.tre")
clements <- read.csv("Clade_ages/Oscines/eBird-Clements-v2019-integrated-checklist-August-2019.9_primaried_oscine.species.csv", stringsAsFactors = FALSE)
clements$scientific.name <- gsub(" ", "_", clements$scientific.name)

clements.names <- clements %>% dplyr::select(TAXON_ORDER, scientific.name)
sample.data <- dplyr::left_join(sample.data, clements.names, by = "TAXON_ORDER")

#fix Poospiza_whitii
sample.data[442, 13] <- "Poospiza_whitii"

sample.data <- sample.data %>%
  separate(col = scientific.name, 
           into = c("Genus.Clements", "species.Clements"), 
           sep = "_",
           remove = FALSE)

# a little trick to pull out all subtending branch lengths
# thanks to: https://www.biostars.org/p/396338/
sub.branch <- setNames(tree$edge.length[sapply(1:length(tree$tip.label),function(x,y) which (y==x),y=tree$edge[,2])],tree$tip.label)

write.csv(sample.data, file = "Clade_ages/Oscines/eBird-Clements-v2019-integrated-checklist-August-2019.9_primaried_oscine.species.formatted.csv", row.names = FALSE)

#-------------------------------------------------------------------------
# Genera

genus.map <- sample.data$Genus.Clements
names(genus.map) <- sample.data$tree_taxon

# Which genera in tree?
genus.present <- unique(genus.map[tree$tip.label])
genus.present <- genus.present[-174] # remove an NA in the data

# Get clade ages of genera
crown.ages <- vector()
stem.ages <- vector()
for(i in 1:length(genus.present)) {
  genus.tips <- tree$tip.label[which(genus.map[tree$tip.label] == genus.present[i])]
	if(length(genus.tips) > 1){
	  subclade <- extract.clade(tree, findMRCA(tree, tip=genus.tips))
	  crown.ages <- c(crown.ages, max(nodeHeights(subclade)))

		nn <- findMRCA(tree, tip=genus.tips)
		subclade.stem <- extract.clade(tree, phangorn::Ancestors(tree, nn, "parent"))
		stem.ages <- c(stem.ages, max(nodeHeights(subclade.stem)))
		
		#plot(extract.clade(tree, findMRCA(tree, tip=genus.tips)))
	} else {
	  crown.ages <- c(crown.ages, NA)
	  stem <- sub.branch[genus.tips]
		stem.ages <- c(stem.ages, stem)
	}
}

names(crown.ages) <- genus.present
names(stem.ages) <- genus.present

# remove monotypic clades (don't)
crown.ages.genus <- crown.ages #[!is.na(crown.ages)]
stem.ages.genus <- stem.ages #[!is.na(stem.ages)]


crown.ages.genus.df <- as.data.frame(crown.ages.genus)
stem.ages.genus.df <- as.data.frame(stem.ages.genus)

# change "stem" age to "lineage" age per Remsen recommendation
colnames(crown.ages.genus.df) <- c("Clade.age")
crown.ages.genus.df$group <- "Crown.age.genus"
colnames(stem.ages.genus.df) <- c("Clade.age")
stem.ages.genus.df$group <- "Lineage.age.genus"

stem.ages.genus.df$Clade <- rownames(stem.ages.genus.df)
crown.ages.genus.df$Clade <- rownames(crown.ages.genus.df)

genus.df <- dplyr::bind_rows(crown.ages.genus.df, stem.ages.genus.df)
genus.df$level <- "genus"

# crown.ages
# median(crown.ages, na.rm=TRUE)
# summary(crown.ages.genus)
# which(crown.ages.genus == max(crown.ages.genus))
# which(stem.ages.genus == max(stem.ages.genus))
# boxplot(crown.ages.genus)


#-------------------------------------------------------------------------
# Families

# Which families in tree?
family.map <- sample.data$Family.Clements
names(family.map) <- sample.data$tree_taxon
family.present <- unique(family.map[tree$tip.label])
family.present <- family.present[-17] # remove an NA in the data

# Get clade ages of families
crown.ages.family <- vector()
stem.ages.family <- vector()
for(i in 1:length(family.present)) {
  family.tips <- tree$tip.label[which(family.map[tree$tip.label] == family.present[i])]
  if(length(family.tips) > 1){
    subclade <- extract.clade(tree, findMRCA(tree, tip=family.tips))
    crown.ages.family <- c(crown.ages.family, max(nodeHeights(subclade)))
    
    nn <- findMRCA(tree, tip=family.tips)
    subclade.stem <- extract.clade(tree, phangorn::Ancestors(tree, nn, "parent"))
    stem.ages.family <- c(stem.ages.family, max(nodeHeights(subclade.stem)))

    #plot(extract.clade(tree, findMRCA(tree, tip=family.tips)))
  } else {
    crown.ages.family <- c(crown.ages.family, NA)
    stem <- sub.branch[family.tips]
    stem.ages.family <- c(stem.ages.family, stem)
  }
}

names(crown.ages.family) <- family.present
names(stem.ages.family) <- family.present

# remove monotypic clades (don't)
crown.ages.family <- crown.ages.family #[!is.na(crown.ages.family)]
stem.ages.family <- stem.ages.family #[!is.na(stem.ages.family)]

crown.ages.family.df <- as.data.frame(crown.ages.family)
stem.ages.family.df <- as.data.frame(stem.ages.family)

# change "stem" age to "lineage" age per Remsen recommendation
colnames(crown.ages.family.df) <- c("Clade.age")
crown.ages.family.df$group <- "Crown.age.family"
colnames(stem.ages.family.df) <- c("Clade.age")
stem.ages.family.df$group <- "Lineage.age.family"

stem.ages.family.df$Clade <- rownames(stem.ages.family.df)
crown.ages.family.df$Clade <- rownames(crown.ages.family.df)

family.df <- dplyr::bind_rows(crown.ages.family.df, stem.ages.family.df)
family.df$level <- "family"

# summary(crown.ages.family)
# which(crown.ages.family == min(crown.ages.family))
# which(stem.ages.family == max(stem.ages.family))


#-------------------------------------------------------------------------
# combine and plot data

joined.df <- dplyr::bind_rows(genus.df, family.df)
joined.df$group <- factor(joined.df$group, levels=c("Crown.age.genus", "Lineage.age.genus", "Crown.age.family", "Lineage.age.family"))
write.csv(joined.df, file = "Clade_ages/Clade_ages.all_data.oscines.forPlotting.csv", row.names = FALSE)

ggplot(data = joined.df, aes(x = group, y = Clade.age)) +
  geom_boxplot() +
  theme_classic() +
  ggtitle("Age of oscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_oscine_genera_and_families.pdf")

ggplot(data = joined.df, aes(x = group, y = Clade.age)) +
  geom_violin() +
  theme_classic() +
  stat_summary(fun.data=data_summary) + 
  ggtitle("Age of oscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_oscine_genera_and_families.violin.pdf")



# boxplot with lines connecting paired points 
pos <- position_dodge(width = 0.6)

# https://stackoverflow.com/questions/53377299/ggrepel-using-position-dodge-in-combination-with-geom-label-repel

ggplot(data = joined.df, aes(x = group, y = Clade.age, label=Clade)) +
  geom_boxplot(outlier.shape = NA, fill = "lightgray") +
  geom_line(aes(group=Clade), position = pos, alpha = 0.3) +
  geom_point(aes(group=Clade), position = pos) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.genus" & Clade.age > 9),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.genus" & Clade.age > 12),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.family" & Clade.age > 12),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.family" & Clade.age < 9),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.family" & Clade.age > 14),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.family" & Clade.age < 11.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  # geom_text(data=subset(joined.df, level == "genus" & Clade.age > 26)) +
  theme_classic() +
  ggtitle("Age of oscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_oscine_genera_and_families.paired.pdf",
       height = 15, width = 15, units = "in")

#-------------------------------------------------------------------------
# ratio of lineage age to crown age
# maybe this will account for long branches?
# not sure what this is giving me, but maybe I could 

genus.t <- dplyr::full_join(crown.ages.genus.df, stem.ages.genus.df, by = "Clade")
family.t <- dplyr::full_join(crown.ages.family.df, stem.ages.family.df, by = "Clade")

genus.t <- genus.t %>%
     mutate(ratio = Clade.age.y / Clade.age.x)
genus.t <- genus.t %>%
  mutate(ratio.reverse = Clade.age.x / Clade.age.y)


genus.ratio <- genus.t %>% dplyr::select(Clade, ratio, ratio.reverse)  

sd.max <- mean(genus.ratio$ratio) + sd(genus.ratio$ratio)
sd.min <- mean(genus.ratio$ratio) - sd(genus.ratio$ratio)

old.ratios <- genus.ratio %>% dplyr::filter(ratio > sd.max)
young.ratios <- genus.ratio %>% dplyr::filter(ratio < sd.min) # none


# genus.ratio %>% dplyr::filter(ratio < 1.021) # Xolmis is the min
# which(genus.t$ratio == max(genus.t$ratio))
# genus.t[37,] # Laniocera is the max
# boxplot(genus.t$ratio)
# boxplot(genus.t$ratio.reverse)

youngest.ratio.r <- genus.ratio %>% 
  dplyr::filter(ratio.reverse == min(genus.ratio$ratio.reverse))
youngest.crown.age <- crown.ages.genus.df %>% 
  dplyr::filter(Clade == youngest.ratio.r$Clade[1])

#-------------------------------------------------------------------------
# pull out exceptionally old or young families and genera
# save data files

sd.max.genus <- mean(crown.ages.genus, na.rm = TRUE) + sd(crown.ages.genus, na.rm = TRUE)
sd.min.genus <- mean(crown.ages.genus, na.rm = TRUE) - sd(crown.ages.genus, na.rm = TRUE)
sd.max.family <- mean(crown.ages.family, na.rm = TRUE) + sd(crown.ages.family, na.rm = TRUE)
sd.min.family <- mean(crown.ages.family, na.rm = TRUE) - sd(crown.ages.family, na.rm = TRUE)

old.families <- crown.ages.family[crown.ages.family > sd.max.family]
young.families <- crown.ages.family[crown.ages.family < sd.min.family]
old.genera <- crown.ages.genus[crown.ages.genus > sd.max.genus]
young.genera <- crown.ages.genus[crown.ages.genus < sd.min.genus]

old.families.df <- as.data.frame(old.families)
young.families.df <- as.data.frame(young.families)
old.genera.df <- as.data.frame(old.genera)
young.genera.df <- as.data.frame(young.genera)

colnames(old.families.df) <- colnames(young.families.df) <- c("Clade.age")
colnames(old.genera.df) <- colnames(young.genera.df) <- c("Clade.age")

old.families.df$family <- names(old.families)
young.families.df$family <- names(young.families)
old.genera.df$genus <- names(old.genera)
young.genera.df$genus <- names(young.genera)

old.families.df <- old.families.df %>% dplyr::filter(!is.na(family))
young.families.df <- young.families.df %>% dplyr::filter(!is.na(family))
old.genera.df <- old.genera.df %>% dplyr::filter(!is.na(genus))
young.genera.df <- young.genera.df %>% dplyr::filter(!is.na(genus))

write.csv(old.families.df, file = "Clade_ages/old.families.oscines.csv", row.names = FALSE)
write.csv(young.families.df, file = "Clade_ages/young.families.oscines.csv", row.names = FALSE)
write.csv(old.genera.df, file = "Clade_ages/old.genera.oscines.csv", row.names = FALSE)
write.csv(young.genera.df, file = "Clade_ages/young.genera.oscines.csv", row.names = FALSE)

# write data
genus.df.out <- full_join(crown.ages.genus.df, stem.ages.genus.df, by = "Clade")
colnames(genus.df.out) <- c("crown.age", "group.x", "Clade", "lineage.age", "group.y")
genus.df.out$level <- "genus"
genus.df.out <- genus.df.out[,c(3,6,1,4)]

family.df.out <- full_join(crown.ages.family.df, stem.ages.family.df, by = "Clade")
colnames(family.df.out) <- c("crown.age", "group.x", "Clade", "lineage.age", "group.y")
family.df.out$level <- "family"
family.df.out <- family.df.out[,c(3,6,1,4)]

joined.df.out <- dplyr::bind_rows(genus.df.out, family.df.out)
write.csv(joined.df.out, file = "Clade_ages/Clade_ages.all_data.oscines.csv", row.names = FALSE)

# write "input" data, for Van
sample.data.out <- sample.data %>% 
  dplyr::select(scientific.name, tree_taxon, Family.Clements, Genus.Clements, species.Clements)
write.csv(sample.data.out, file = "Clade_ages/Clade_ages.Sample_data.oscines.csv", row.names = FALSE)



