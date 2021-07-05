setwd("/Volumes/Backup_Plus/Tyranni_traits")
getwd()

library(ape)
library(phytools)
library(phangorn)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)

sample.data <- read.csv("All_datasets/song_morphometrics_niche-Clements.Name.v2.csv", stringsAsFactors = FALSE)
tree <- read.tree(file = "trees/T400F_dupsdropped.phy")

data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}


# species-level tree
keep <- unique(as.character(sample.data$Suboscine.tree.Tip.Name.Clements))
keep <- keep[-23] # remove NA
tree.sp <- keep.tip(tree, keep)

# a little trick to pull out all subtending branch lengths
# thanks to: https://www.biostars.org/p/396338/
sub.branch <- setNames(tree.sp$edge.length[sapply(1:length(tree.sp$tip.label),function(x,y) which (y==x),y=tree.sp$edge[,2])],tree.sp$tip.label)

#-------------------------------------------------------------------------
# Genera

genus.map <- sample.data$Genus.Clements
names(genus.map) <- sample.data$Suboscine.tree.Tip.Name.Clements

# Which genera in tree?
genus.present <- unique(genus.map[tree$tip.label])
genus.present <- genus.present[-3] # remove an NA in the data

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
family.map <- sample.data$Family_Clements
names(family.map) <- sample.data$Suboscine.tree.Tip.Name.Clements
family.present <- unique(family.map[tree$tip.label])
family.present <- family.present[-2] # remove an NA in the data

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
write.csv(joined.df, file = "Clade_ages/Clade_ages.all_data.forPlotting.csv", row.names = FALSE)

ggplot(data = joined.df, aes(x = group, y = Clade.age)) +
  geom_boxplot() +
  theme_classic() +
  ggtitle("Age of suboscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_suboscine_genera_and_families.pdf")

ggplot(data = joined.df, aes(x = group, y = Clade.age)) +
  geom_violin() +
  theme_classic() +
  stat_summary(fun.data=data_summary) + 
  ggtitle("Age of suboscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_suboscine_genera_and_families.violin.pdf")



# boxplot with lines connecting paired points 
pos <- position_dodge(width = 0.6)

# https://stackoverflow.com/questions/53377299/ggrepel-using-position-dodge-in-combination-with-geom-label-repel

ggplot(data = joined.df, aes(x = group, y = Clade.age, label=Clade)) +
  geom_boxplot(outlier.shape = NA, fill = "lightgray") +
  geom_line(aes(group=Clade), position = pos, alpha = 0.3) +
  geom_point(aes(group=Clade), position = pos) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.genus" & Clade.age > 26),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.genus" & Clade.age > 16),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.family" & Clade.age > 35.5 & Clade.age < 36),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.family" & Clade.age < 25.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.family" & Clade.age > 23.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.family" & Clade.age < 19),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  # geom_text(data=subset(joined.df, level == "genus" & Clade.age > 26)) +
  theme_classic() +
  ggtitle("Age of suboscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_suboscine_genera_and_families.paired.pdf",
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

sd.max.genus <- mean(crown.ages.genus) + sd(crown.ages.genus)
sd.min.genus <- mean(crown.ages.genus) - sd(crown.ages.genus)
sd.max.family <- mean(crown.ages.family) + sd(crown.ages.family)
sd.min.family <- mean(crown.ages.family) - sd(crown.ages.family)

old.families <- crown.ages.family[crown.ages.family > sd.max.family]
young.families <- crown.ages.family[crown.ages.family < sd.min.family]
old.genera <- crown.ages.genus[crown.ages.genus > sd.max.genus]
young.genera <- crown.ages.genus[crown.ages.genus < sd.min.genus]

old.families.df <- as.data.frame(old.families)
young.families.df <- as.data.frame(young.families)
old.genera.df <- as.data.frame(old.genera)
young.genera.df <- as.data.frame(young.genera)

write.csv(old.families.df, file = "Clade_ages/old.families.csv", row.names = TRUE)
write.csv(young.families.df, file = "Clade_ages/young.families.csv", row.names = TRUE)
write.csv(old.genera.df, file = "Clade_ages/old.genera.csv", row.names = TRUE)
write.csv(young.genera.df, file = "Clade_ages/young.genera.csv", row.names = TRUE)


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
write.csv(joined.df.out, file = "Clade_ages/Clade_ages.all_data.csv", row.names = FALSE)

# write "input" data, for Van
sample.data.out <- sample.data %>% 
  dplyr::select(Clements.Name, Suboscine.tree.Tip.Name.Clements, Family_Clements, Family, Genus.Clements, Genus)
write.csv(sample.data.out, file = "Clade_ages/Clade_ages.Sample_data.csv", row.names = FALSE)



