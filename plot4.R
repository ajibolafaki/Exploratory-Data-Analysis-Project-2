library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal_sources <- SCC[coal,]
coal_emissions <- NEI[(NEI$SCC %in% coal_sources$SCC), ]

png("plot4.png")

coal_emissions %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)) %>%
  ggplot(aes(x=factor(year), y=Emissions)) +
  geom_bar(stat = "identity") +
  labs(x = 'Years', y = 'Emissions', title = 'Emissions from Coal Combustion in Kilotons')

dev.off()