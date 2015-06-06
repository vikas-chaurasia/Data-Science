
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
library(sqldf)
##electric<-read.csv("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,sep=";")
electric<-read.csv.sql(file="household_power_consumption.txt",sql="select * from file where Date=='1/2/2007' or Date=='2/2/2007'",header=TRUE,sep=";")
closeAllConnections()
datetime <- strptime(paste(electric$Date, electric$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(datetime, electric$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, electric$Sub_metering_2, type="l", col="red")
lines(datetime, electric$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2.5, col=c("black", "red", "blue"))
dev.off()

