temp <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=70000)
temp$Date <- as.Date(temp$Date, format = "%d/%m/%Y")
data <- subset(temp, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T"))

for(i in 3:9) {
	data[[i]] <- as.numeric(data[[i]])
}

#plot3
png("plot3.png")
with(data, plot(Time, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
with(data, points(Time, Sub_metering_2, col="red", type = "l"))
with(data, points(Time, Sub_metering_3, col="blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2.5)
dev.off()

