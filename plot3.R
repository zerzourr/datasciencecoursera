import<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
import$Date<-  as.Date(import$Date,"%d/%m/%Y")

myfunc <- function(x,y){import[import$Date >= x & import$Date <= y,]}

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

importsubset <- myfunc(DATE1,DATE2)
importsubset$DateTime<-  strptime(paste(importsubset$Date,importsubset$Time),"%Y-%m-%d %H:%M:%S")

points(importsubset$DateTime,importsubset$Sub_metering_2,type="l",ylim=c(0,40),xlab="",ylab="Energy sub metering",col="red")
points(importsubset$DateTime,importsubset$Sub_metering_3,type="l",ylim=c(0,40),xlab="",ylab="Energy sub metering",col="blue")
points(importsubset$DateTime,importsubset$Sub_metering_1,type="l",ylim=c(0,40),xlab="",ylab="Energy sub metering",col="black")
legend("topright",pch = 19,col=c("red","blue","black"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px") 
dev.off() 


