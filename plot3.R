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

#plot 3
png("plot3.png", width = 480, height = 480)
par(mfrom = c(1,1))
with(data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lwd = 1,text.width = 60000, y.intersp = 0.8, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()