# Read data into memory
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Limit data to dates to be examined
power <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

# Convert dates and times
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Build Plot 2, Global Active Power over time, and save to a PNG file
png("plot2.png", width = 480, height = 480)
with(power, plot(
    power$Time, power$Global_active_power, 
    type = "l", 
    xlab = "", 
    ylab = "Global Active Power (kilowatts)"))
dev.off()
