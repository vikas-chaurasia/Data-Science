#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


library(ggplot2)

#Load Files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

subset_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]


aggregatedByYear<-aggregate(Emissions~year,subset_NEI,sum)

png('plot5.png',width=1000,height=400)
g <- ggplot(aggregatedByYear, aes(year, Emissions, color = year))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*' Emissions')) +
  ggtitle('Total Emissions from Motor Vehicle source in Baltimore City,Maryland from 1999 to 2008')

print(g)
dev.off()