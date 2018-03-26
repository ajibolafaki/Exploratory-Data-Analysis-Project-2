library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot5.png")

NEI %>%
  filter(fips == "24510" & type=="ON-ROAD") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions)) %>%
  ggplot(aes(x=factor(year), y=Emissions)) +
  geom_bar(stat = "identity") +
  labs(x = 'Years', y = 'Emissions', title = 'Motor Vehicle Emissions in Baltimore City')

dev.off()