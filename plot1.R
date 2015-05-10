# Read data into memory
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Limit data to dates to be examined
power <- subset(power, power$Date %in% c("1/2/2007", "2/2/2007"))

# Convert dates and times
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Build Plot 1, Global Active Power, and saves it to a PNG file.
png("plot1.png", width = 480, height = 480)
hist(power2$Global_active_power, 
     col = "red", 
     xlim = c(0, 6),
     ylim = c(0, 1200),
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
