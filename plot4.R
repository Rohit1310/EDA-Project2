### declaring the working directory where the dataset is saved.
setwd("course5")

## reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sorting the dataset as per the requirement

coalData <- SCC[grepl("*coal*", SCC$EI.Sector, ignore.case = TRUE),]
combCoalData <- coalData[grepl("*comb*", coalData$Short.Name, ignore.case = TRUE),]
cityCode <- combCoalData$SCC
coalcombNEI <- NEI[NEI$SCC %in% cityCode,]
emissionValueCC <- by(coalcombNEI$Emissions, as.factor(coalcombNEI$year),sum)

## ploting the emission as per the coal combution 

png("plot4.png")
barplot(emissionValueCC/10^5, 
        main = "Total PM2.5 emission from Carbon Combustion sources",
        xlab = "Year",
        ylab = "PM 2.5 Emission (*10^5)",
        axes = FALSE,
        col = "red")
axis(2)
box()
dev.off()
