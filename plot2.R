## R code for plot 2 - Global Active Power against Time

## Read data from file for 01/02/2007 to 02/02/2007
dat1 <- read.csv("household_power_consumption.txt", 
                 sep = ";",
                 colClasses = c(rep("character",2),rep("numeric",7)),
                 col.names = c("Date","Time","ActP", "ReactP",
                               "Voltage", "Intensity", "M1",
                               "M2","M3"),
                 skip = 66636, nrows = 2880)

## Plot 2 - Global Active Power against Time
ActivePower <- dat1$ActP
date1 <- dat1$Date
time1 <- dat1$Time
x1 <- paste(date1, time1)
x2 <- strptime(x1, format = "%e/%m/%Y %H:%M:%S")

windows()
plot(x2, ActivePower, type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()