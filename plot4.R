## R code for plot 4 - 4 graphs together

## Read data from file for 01/02/2007 to 02/02/2007
dat1 <- read.csv("household_power_consumption.txt", 
                 sep = ";",
                 colClasses = c(rep("character",2),rep("numeric",7)),
                 col.names = c("Date","Time","ActP", "ReactP",
                               "Voltage", "Intensity", "M1",
                               "M2","M3"),
                 skip = 66636, nrows = 2880)

## Data for all 4 graphs
date1 <- dat1$Date
time1 <- dat1$Time
x1 <- paste(date1, time1)
x2 <- strptime(x1, format = "%e/%m/%Y %H:%M:%S")

ActivePower <- dat1$ActP

Volt <- dat1$Voltage

meter1 <- dat1$M1
meter2 <- dat1$M2
meter3 <- dat1$M3

GReactP <- dat1$ReactP

## Plotting the graphs
windows()
par(mfrow = c(2, 2))

## Plot 4a - Global Active Power against Time
plot(x2, ActivePower, type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")

## Plot 4b - Voltage against Time
plot(x2, Volt, type = "l", 
     xlab = "datetime ",
     ylab = "Voltage")

## Plot 4c - Sub metering values against Time
plot(x2, meter1, type = "l", xlab = " ",
     ylab = "Energy sub metering")
lines(x2, meter2, col = "red")
lines(x2, meter3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       text.font = 2)

## Plot 4d - Sub metering values against Time
plot(x2, GReactP, type = "l", 
     xlab = "datetime",
     ylab = "Global_Reactive_Power")

## Copy graphs from screen to png
dev.copy(png, file = "plot4.png")
dev.off()