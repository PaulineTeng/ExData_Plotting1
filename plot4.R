fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "data.zip")
unzip("data.zip")

#Read data
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert to Date Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

#plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = 0, lheight = 1)
with(data, {
     plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
     plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
     plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
     points(DateTime, Sub_metering_2, type = "l", col = "red")
     points(DateTime, Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty = 1, lwd = 1, y.intersp = 0.8, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
     })
#dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()