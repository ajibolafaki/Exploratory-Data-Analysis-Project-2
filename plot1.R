library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_by_year <- NEI %>% 
  group_by(year) %>% 
  summarise(Emissions = sum(Emissions))

png('plot1.png')
with(NEI_by_year, barplot(height = Emissions/1000, names.arg = year, xlab = 'Years', ylab = 'Emissions', 
                          ylim=c(0,8000), main= 'Emissions at various years in kilotons'))    
dev.off()