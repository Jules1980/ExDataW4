## set working directory
setwd("~/Coursera/Data Science/Exploratory Data Analysis/Week 4/exdata_data_NEI_data")


if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

## set working directory
setwd("~/Coursera/Data Science/Exploratory Data Analysis/Week 4")

png("./plot2.png")

barplot(height=aggTotalByYear$Emissions, 
        names.arg=aggTotalByYear$year,
        xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

dev.off()
