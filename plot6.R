### declaring the working directory where the dataset is saved.
setwd("course5")

## reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sorting the dataset as per the requirement

library(dplyr)

baltimoreData <- NEI %>% filter(fips=="24510")
LAdata <- NEI %>% filter(fips =="06037")
motorData <- SCC[grepl("*vehicle*", SCC$SCC.Level.Two, ignore.case = TRUE),]
motorcode <- motorData$SCC
motorbaltimoreNEI <- baltimoreData[baltimoreData$SCC %in% motorcode,]
motorLANEI <- LAdata[LAdata$SCC %in% motorcode,]
emissionValueMotorBalt <- by(motorbaltimoreNEI$Emissions, as.factor(motorbaltimoreNEI$year),sum)
emissionValueMotorLA <- by(motorLANEI$Emissions, as.factor(motorLANEI$year),sum)


##  ploting as per the sorted data:


png("plot6.png")
oldpar <- par()
par(mfcol = c(2,1))
barplot(emissionValueMotorBalt, 
        main = "Total PM2.5 emission from Baltimore city on motor vehicles",
        xlab = "Year",
        ylab = "PM 2.5 Emission",
        axes = FALSE,
        col = "red")
axis(2)
box()

barplot(emissionValueMotorLA, 
        main = "Total PM2.5 emission from LA city on motor vehicles",
        xlab = "Year",
        ylab = "PM 2.5 Emission",
        axes = FALSE,
        col = "green")
axis(2)
box()
dev.off()