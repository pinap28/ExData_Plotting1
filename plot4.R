#Read the data
file <- "household_power_consumption.txt"
dt <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dt[[1]] <- as.Date(dt[[1]],"%d/%m/%Y")
datetime <- strptime(as.character(paste(dt$Date, dt$Time)), "%Y-%m-%d %H:%M:%S")
dt <- cbind(dt, datetime)

#Construct the plot
png(file = "plot4.png", width = 480, heigh = 480)
Sys.setlocale(category = "LC_TIME", locale = "C")
par(mfcol = c(2, 2))
subdt <- subset(dt, Date == "2007-02-01" | Date == "2007-02-02")

#Plot (1,1)
plot(subdt$datetime, subdt$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab ="")

#Plot (1,2)
plot(subdt$datetime, subdt$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab ="")
points(subdt$datetime, subdt$Sub_metering_2, type = "l",
     col = "red")
points(subdt$datetime, subdt$Sub_metering_3, type = "l",
     col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

#Plot (2,1)
plot(subdt$datetime, subdt$Voltage, type = "l", xlab ="datetime",
     ylab = "Voltage")

#Plot (2,2)
plot(subdt$datetime, subdt$Global_reactive_power, type = "l", 
     xlab ="datetime", ylab = "Global_reactive_power")

dev.off()
