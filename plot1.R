power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
library(lubridate)
power$Date<-dmy(power$Date)
power2<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

power2$Global_active_power<- as.numeric(as.character(power2$Global_active_power) )

par(mfrow=c(1,1), mar=c(5,5,2,2))
hist(power2$Global_active_power, breaks=12,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()
