### declaring the working directory where the dataset is saved.
setwd("course5")

## reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sorting the data as per the years
emissionValue <- by(NEI$Emissions, as.factor(NEI$year),sum)

### plot for total emissions from PM2.5 decreased in the United States from 1999 to 2008
png("plot1.png")
barplot(emissionValue/10^6, 
        main = "Total PM2.5 emission from all sources",
        xlab = "Year",
        ylab = "PM 2.5 Emission (*10^6)",
        axes = FALSE,
        col = "red")
axis(2)
box()
dev.off()