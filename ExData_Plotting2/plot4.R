#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?


library(ggplot2)

#Load Files
if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# merge the two data sets 
if(!exists("mergedata")){
  mergedata <- merge(NEI, SCC, by="SCC")
}

SCC_COAL = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]
subset_mergedata<-mergedata[SCC_COAL,]

aggregatedByYear<-aggregate(Emissions~year,subset_mergedata,sum)

png('plot4.png')
g <- ggplot(aggregatedByYear, aes(year, Emissions, color = year))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal combustion source from 1999 to 2008')

print(g)
dev.off()