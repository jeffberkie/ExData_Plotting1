# Read data into memory
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Limit data to dates to be examined
power <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

# Convert dates and times
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Build Plot 3, Submetering over time, and save to a PNG file
png("plot3.png", width = 480, height = 480)
with(power, plot(
    power$Time, power$Sub_metering_1,  
    type = "l", 
    xlab = "", 
    ylab = "Energy sub metering"))
lines(power$Time, power$Sub_metering_2, col = "red")
lines(power$Time, power$Sub_metering_3, col = "blue")
legend("topright", 
       lty = 1,
       col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
