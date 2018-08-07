### declaring the working directory where the dataset is saved.
setwd("course5")

## reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting using the ggplot2 library

library(ggplot2)

png("plot3.png")

mnp <- qplot(as.factor(year),Emissions, data = baltimoreData, facets = .~type, fill = type) +
  geom_bar(stat = "identity") +
  guides(fill=FALSE) +
  labs(x = "Years", y = " Total PM 2.5") + 
  labs(title = "Emissions from 1999-2008 for Baltimore City on Type")

print(mnp)

dev.off()

