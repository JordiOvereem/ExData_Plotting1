## Course Project 1 - Exploratory Data Analysis by Jordi Overeem
## This code produces plot4.png.

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors = FALSE, dec=".")

# Convert and subset data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(subset_data$Global_active_power)
subset_data$datetime <- as.POSIXct(subset_data$datetime)

# Create and save plot 4
par(mfrow = c(2,2))
attach(subset_data)
plot(GAP ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty =, lwd = 2.5, cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(Global_reactive_power ~ datetime, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(subset_data)
