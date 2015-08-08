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

#plot 2
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
