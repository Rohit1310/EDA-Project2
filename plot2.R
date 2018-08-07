### declaring the working directory where the dataset is saved.
setwd("course5")

## reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sorting the dataset as per the requirement

baltimoreData <- NEI %>% filter(fips=="24510")
emissionValueBaltimore <- by(baltimoreData$Emissions, as.factor(baltimoreData$year),sum)

## plot for total emissions from PM2.5 decreased in the Baltimore City, Maryland
library(dplyr)

png("plot2.png")
barplot(emissionValueBaltimore/10^3, 
        main = "Total PM2.5 emission from all sources for Baltimore City, Maryland",
        xlab = "Year",
        ylab = "PM 2.5 Emission (*10^3)",
        axes = FALSE,
        col = "red")
axis(2)
box()
dev.off()

