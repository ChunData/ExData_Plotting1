## R code for plot 3 - Sub metering values against Time

## Read data from file for 01/02/2007 to 02/02/2007
dat1 <- read.csv("household_power_consumption.txt", 
                 sep = ";",
                 colClasses = c(rep("character",2),rep("numeric",7)),
                 col.names = c("Date","Time","ActP", "ReactP",
                               "Voltage", "Intensity", "M1",
                               "M2","M3"),
                 skip = 66636, nrows = 2880)

## Plot 3 - Sub metering values against Time
meter1 <- dat1$M1
meter2 <- dat1$M2
meter3 <- dat1$M3
date1 <- dat1$Date
time1 <- dat1$Time
x1 <- paste(date1, time1)
x2 <- strptime(x1, format = "%e/%m/%Y %H:%M:%S")

windows()
plot(x2, meter1, type = "l", xlab = " ",
     ylab = "Energy sub metering")
lines(x2, meter2, col = "red")
lines(x2, meter3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       text.font = 2)

dev.copy(png, file = "plot3.png")
dev.off()