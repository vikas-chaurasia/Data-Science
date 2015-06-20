
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
library(sqldf)
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
electric<-read.csv.sql(file="household_power_consumption.txt",sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007'",header=TRUE,sep=";")
closeAllConnections()
hist(electric$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

