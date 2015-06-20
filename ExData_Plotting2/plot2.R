#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
.

#Load Files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

subset_NEI  <- NEI[NEI$fips=="24510", ]


aggregatedByYear<-aggregate(Emissions~year,subset_NEI,sum)
png('plot1.png')
barplot(height=aggregatedByYear$Emissions,names.arg=aggregatedByYear$year,xlab="years",ylab=expression('total PM'[2.5]*'Emission '),main=expression('Total PM'[2.5]*'in the Baltimore City,MaryLand emissions at various years'),col=c("bisque","bisque2","bisque3","bisque4"))
dev.off()