

## set working directory
setwd("~/Coursera/Data Science/Exploratory Data Analysis/Week 4/exdata_data_NEI_data")

## read in emissions data
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
    ## yes emissions have dropped from 7332967 (1999) to 3464206 (2008)
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
##      all sources for each of the years 1999, 2002, 2005, and 2008.

aggTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

## set working directory
setwd("~/Coursera/Data Science/Exploratory Data Analysis/Week 4")

png("./plot1.png")
barplot(height = aggTotalByYear$Emissions, 
        names.arg = aggTotalByYear$year, 
        xlab = "years", 
        ylab = expression('Total PM'[2.5]*' Emission'), 
        main = expression('Total PM'[2.5]*' Emission at various years'))
dev.off()

