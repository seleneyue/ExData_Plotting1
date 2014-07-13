temp <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=70000)
temp$Date <- as.Date(temp$Date, format = "%d/%m/%Y")
data <- subset(temp, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T"))

for(i in 3:9) {
	data[[i]] <- as.numeric(data[[i]])
}

#plot4
png("plot4.png")
par(mfcol=c(2,2))
with(data, {
	plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
	
	plot(Time, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
	points(Time, Sub_metering_2, col="red", type = "l")
	points(Time, Sub_metering_3, col="blue", type = "l")
	legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2.5, bty="n")
	
	plot(Time, Voltage, xlab = "datetime", type = "l")
	
	plot(Time, Global_reactive_power, xlab = "datetime", type = "l")
})
dev.off()
