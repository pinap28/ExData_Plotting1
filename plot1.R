#Read the data
file <- "household_power_consumption.txt"
dt <- read.table(file, sep = ";", header = TRUE, na.strings = "?")

dt[[1]] <- as.Date(dt[[1]],"%d/%m/%Y")

#Construct the plot
subdt <- subset(dt, Date == "2007-02-01" | Date == "2007-02-02")
hist(subdt$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

#Copy plot
dev.copy(png, file = "plot1.png", width = 480, heigh = 480)
dev.off()