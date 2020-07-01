library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
power_consumption<- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
power_consumption<-subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
na_if(power_consumption, "?")
power_consumption$Global_active_power<- as.numeric(power_consumption$Global_active_power)
png("plot4.png", width= 480, height = 480)
par(mfrow=c(2,2))
#GLobal Active Power Plot
plot(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Global_active_power, type="n", ylab= "Global Active Power", xlab= "")
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Global_active_power)

#Voltage Plot

plot(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Voltage, type="n", ylab= "Voltage", xlab= "")
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Voltage)

#Sub metering Plot

plot(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Sub_metering_1, type="n", ylab= "Energy sub metering", xlab= "")
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Sub_metering_1)
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Sub_metering_2, col="red")
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col= c("black", "red","blue"), lty=1, box.lty= 0 )

# Global Reactive Power
plot(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Global_reactive_power, type="n", ylab= "Global_Reactive_Power", xlab= "")
lines(dmy_hms(paste(power_consumption$Date, power_consumption$Time, sep=" ")), power_consumption$Global_reactive_power)

dev.off()
