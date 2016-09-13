## Course Project 1 - Exploratory Data Analysis by Jordi Overeem
## This code produces plot1.png.

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors = FALSE, dec=".")

# Convert and subset data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(subset_data$Global_active_power)

# Create and save plot 1
par(mfrow = c(1,1))
attach(subset_data)
hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(subset_data)