power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
library(lubridate)
power$Date<-dmy(power$Date)
power2<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

power2$Global_active_power<- as.numeric(as.character(power2$Global_active_power) )
power2<-mutate(power2, timeDate=as.POSIXct(paste(power2$Date, power2$Time), format="%Y-%m-%d %H:%M:%S"))
power2$Sub_metering_1<-as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2<-as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3<-as.numeric(power2$Sub_metering_3)
power2$Voltage<-as.numeric(power2$Voltage)

par(mfrow=c(2,2), mar=c(3,5,1,2))
with(power2, plot(timeDate,Global_active_power, type="l",ylab="Global Active Power (kilowatts", xlab=""))

with(power2, plot(timeDate, Voltage, type="l", xlab="datetime"))

with(power2, plot(timeDate, Sub_metering_1, type="l",ylab="Energy Sub Metering", xlab=""))
with(power2, lines(timeDate, Sub_metering_2, type="l", col="red"))
with(power2, lines(timeDate, Sub_metering_3, type="l", col="blue"))


legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

with(power2, plot(timeDate, Global_reactive_power, type="l", xlab="datetime"))
dev.copy(png, "plot4.png")
dev.off()
