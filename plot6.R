library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Bmore_county <- NEI %>%
  filter(fips == "24510" & type=="ON-ROAD") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)) %>%
  mutate(county = "Baltimore City")

LA_county <- NEI %>%
  filter(fips == "06037" & type=="ON-ROAD") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)) %>% 
  mutate(county = "Los Angeles")

Bmore_LA <- rbind(Bmore_county, LA_county)

png("plot6.png")

Bmore_LA %>%
  ggplot(aes(x=factor(year), y=Emissions)) +
  geom_bar(stat = "identity") +
  facet_grid(county~., scales="free") +
  labs(x = 'Years', y = 'Emissions', title = 'Motor Vehicle Emissions - Baltimore vs. Los Angeles')

dev.off()