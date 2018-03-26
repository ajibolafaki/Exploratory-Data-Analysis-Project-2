library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Bmore <- NEI %>% 
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarise(Emissions = sum(Emissions))

png('plot2.png')
with(Bmore, barplot(height = Emissions/1000, names.arg = year, xlab = 'Years', ylab = 'Emissions', 
                    ylim=c(0,4), main= 'Baltimore City Emissions in kilotons'))    
dev.off()