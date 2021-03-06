temp <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=70000)
temp$Date <- as.Date(temp$Date, format = "%d/%m/%Y")
data <- subset(temp, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %T"))

for(i in 3:9) {
	data[[i]] <- as.numeric(data[[i]])
}

#plot1
png("plot1.png")
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.off()
