setwd("/Volumes/Backup_Plus/Tyranni_traits")
getwd()

library(ape)
library(phytools)
library(phangorn)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)

joined.df.oscine <- read.csv("Clade_ages/Clade_ages.all_data.oscines.forPlotting.csv", stringsAsFactors = FALSE)
joined.df.suboscine <- read.csv("Clade_ages/Clade_ages.all_data.forPlotting.csv", stringsAsFactors = FALSE)

joined.df.oscine$group <- gsub("Crown.age.genus", "Crown.age.oscine.genus", joined.df.oscine$group)
joined.df.oscine$group <- gsub("Lineage.age.genus", "Lineage.age.oscine.genus", joined.df.oscine$group)
joined.df.oscine$group <- gsub("Crown.age.family", "Crown.age.oscine.family", joined.df.oscine$group)
joined.df.oscine$group <- gsub("Lineage.age.family", "Lineage.age.oscine.family", joined.df.oscine$group)

joined.df.suboscine$group <- gsub("Crown.age.genus", "Crown.age.suboscine.genus", joined.df.suboscine$group)
joined.df.suboscine$group <- gsub("Lineage.age.genus", "Lineage.age.suboscine.genus", joined.df.suboscine$group)
joined.df.suboscine$group <- gsub("Crown.age.family", "Crown.age.suboscine.family", joined.df.suboscine$group)
joined.df.suboscine$group <- gsub("Lineage.age.family", "Lineage.age.suboscine.family", joined.df.suboscine$group)


joined.df <- dplyr::bind_rows(joined.df.oscine, joined.df.suboscine)
joined.df$group <- factor(joined.df$group, 
                          levels=c("Crown.age.oscine.genus", "Lineage.age.oscine.genus",
                                   "Crown.age.suboscine.genus", "Lineage.age.suboscine.genus", 
                                   "Crown.age.oscine.family", "Lineage.age.oscine.family",
                                   "Crown.age.suboscine.family", "Lineage.age.suboscine.family"))

#-------------------------------------------------------------------------
# combine and plot data

# boxplot with lines connecting paired points 
pos <- position_dodge(width = 0.6)

# https://stackoverflow.com/questions/53377299/ggrepel-using-position-dodge-in-combination-with-geom-label-repel

ggplot(data = joined.df, aes(x = group, y = Clade.age, label=Clade)) +
  geom_boxplot(outlier.shape = NA, fill = "lightgray") +
  geom_line(aes(group=Clade), position = pos, alpha = 0.3) +
  geom_point(aes(group=Clade), position = pos) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.oscine.genus" & Clade.age > 9),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.oscine.genus" & Clade.age > 12),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.oscine.family" & Clade.age > 12),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.oscine.family" & Clade.age < 9),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.oscine.family" & Clade.age > 14),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.oscine.family" & Clade.age < 11.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) + 
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.suboscine.genus" & Clade.age > 16),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.suboscine.genus" & Clade.age > 26),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.suboscine.family" & Clade.age > 23.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Crown.age.suboscine.family" & Clade.age < 19),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.suboscine.family" & Clade.age > 35.5 & Clade.age < 36),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  geom_label_repel(data = . %>%
                     filter(group == "Lineage.age.suboscine.family" & Clade.age < 25.5),
                   aes(group=Clade), position = pos,
                   box.padding = 0.25,
                   min.segment.length = Inf) +
  # geom_text(data=subset(joined.df, level == "genus" & Clade.age > 26)) +
  theme_classic() +
  ggtitle("Age of suboscine and oscine clades") +
  xlab("") +
  ylab("Clade age (Ma)")

ggsave(file="plots/Clade_ages/Clade_age_Combined_genera_and_families.paired.2.pdf",
       height = 15, width = 20, units = "in")


