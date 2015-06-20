#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)variable, which of these four sources have seen decreases in emissions 1999-2008 for Baltimore City?Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

#Load Files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

subset_NEI  <- NEI[NEI$fips=="24510", ]


aggregatedByYearandType<-aggregate(Emissions~year+type,subset_NEI,sum)
png('plot3.png')
g <- ggplot(aggregatedByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')


print(g)
dev.off()