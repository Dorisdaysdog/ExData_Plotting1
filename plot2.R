power<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
library(lubridate)
power$Date<-dmy(power$Date)
power2<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

power2$Global_active_power<- as.numeric(as.character(power2$Global_active_power) )
power2<-mutate(power2, timeDate=as.POSIXct(paste(power2$Date, power2$Time), format="%Y-%m-%d %H:%M:%S"))
par(mfrow=c(1,1), mar=c(5,5,2,2))
with(power2, plot(timeDate,Global_active_power, type="l",ylab="Global Active Power (kilowatts", xlab=""))


dev.copy(png, "plot2.png")
dev.off()
