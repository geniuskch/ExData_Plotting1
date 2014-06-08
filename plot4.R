power <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings='?', colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"), ]
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(power$DateTime, power$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(power$DateTime, power$Voltage, xlab="datetime", ylab="Voltage", type="l")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
plot(power$DateTime, power$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        

dev.off()