library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot3.png")

NEI %>% 
  filter(fips == "24510") %>% 
  group_by(year, type) %>% 
  summarise(Emissions = sum(Emissions)) %>% 
  ggplot(aes(x=factor(year), y=Emissions)) +
  geom_bar(stat = "identity") +
  facet_grid(.~ type) +
  labs(x = 'Years', y = 'Emissions', title = 'Baltimore City Emissions by Type')

dev.off()