power <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings='?', colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"), ]
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(power$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()