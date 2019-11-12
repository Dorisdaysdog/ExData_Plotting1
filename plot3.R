power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
library(lubridate)
power$Date<-dmy(power$Date)
power2<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

power2$Global_active_power<- as.numeric(as.character(power2$Global_active_power) )
power2<-mutate(power2, timeDate=as.POSIXct(paste(power2$Date, power2$Time), format="%Y-%m-%d %H:%M:%S"))
power2$Sub_metering_1<-as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2<-as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3<-as.numeric(power2$Sub_metering_3)

par(mfrow=c(1,1), mar=c(5,5,2,2))
with(power2, plot(timeDate, Sub_metering_1, type="l",ylab="Energy Sub Metering", xlab=""))
with(power2, lines(timeDate, Sub_metering_2, type="l", col="red"))
with(power2, lines(timeDate, Sub_metering_3, type="l", col="blue"))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.copy(png, "plot3.png")
dev.off()
