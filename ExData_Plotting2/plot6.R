#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)

#Load Files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

subset_NEI <- NEI[NEI$fips=="24510"|NEI$fips=='06037' & NEI$type=="ON-ROAD",  ]


aggregatedByYearandfips<-aggregate(Emissions~year+fips,subset_NEI,sum)
aggregatedByYearandfips$fips[aggregatedByYearandfips$fips=="24510"] <- "Baltimore, MD"

aggregatedByYearandfips$fips[aggregatedByYearandfips$fips=="06037"] <- "Los Angeles, CA"



png('plot6.png',width=1000,height=400)
g <- ggplot(aggregatedByYearandfips, aes(year, Emissions),fill=factors(year))
g <- g + facet_grid(. ~ fips)
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*' Emissions')) +
  ggtitle('Total Emissions from motor vehicle source (Baltimore City, MD vs Los Angeles, CA) from  1999-2008')

print(g)
dev.off()