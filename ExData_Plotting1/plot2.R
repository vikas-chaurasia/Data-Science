
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
library(sqldf)
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
electric<-read.csv.sql(file="household_power_consumption.txt",sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007'",header=TRUE,sep=";")
closeAllConnections()
datetime <- strptime(paste(electric$Date, electric$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime, electric$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()

