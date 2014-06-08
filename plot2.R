#Read the data
file <- "household_power_consumption.txt"
dt <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dt[[1]] <- as.Date(dt[[1]],"%d/%m/%Y")
datetime <- strptime(as.character(paste(dt$Date, dt$Time)), "%Y-%m-%d %H:%M:%S")
dt <- cbind(dt, datetime)

#Construct the plot
Sys.setlocale(category = "LC_TIME", locale = "C")
subdt <- subset(dt, Date == "2007-02-01" | Date == "2007-02-02")
plot(subdt$datetime, subdt$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab ="")

#Copy plot
dev.copy(png, file = "plot2.png", width = 480, heigh = 480)
dev.off()