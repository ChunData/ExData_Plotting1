## R code for plot 1 - Histogram for Global Active Power

## Read data from file for 01/02/2007 to 02/02/2007
dat1 <- read.csv("household_power_consumption.txt", 
                 sep = ";",
                 colClasses = c(rep("character",2),rep("numeric",7)),
                 col.names = c("Date","Time","ActP", "ReactP",
                               "Voltage", "Intensity", "M1",
                               "M2","M3"),
                 skip = 66636, nrows = 2880)

## Data for plot 1
ActivePower <- dat1$ActP

## Plot plot 1 histogram and copy to png
windows()
hist(ActivePower, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, file = "plot1.png")
dev.off()