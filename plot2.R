power <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings='?', colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"), ]
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(power$DateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()