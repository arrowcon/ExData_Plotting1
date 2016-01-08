#Following R-code plots the time series plot (plot #4) in the assignment, and 
#stores the plot in a png file.  It reads the household_power_consumption.txt
#file from the same directory that the R-code is in, and then plots out the
#time-series plot and then stores the plot into a png file, called plot4.png.

library(date)

# read in data from household_power_consumption.txxt from same directory
power <- read.table("household_power_consumption.txt",sep =";", header = T)

#subset in the two days worth of data
course4Proj1a <- subset(power, Date == "1/2/2007")
course4Proj1b <- subset(power, Date == "2/2/2007")

#bind those 2 days' worth of data together.
course4Proj1 <- rbind(course4Proj1a, course4Proj1b)

#Set up 2 by 2 plotting window
par(mfrow = c(2,2))

#  Plot 1 plot
course4Proj1$Global_active_power <- as.numeric(course4Proj1$Global_active_power)/500
#Plot histogram per specification
hist(as.numeric(course4Proj1$Global_active_power), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#  Plot 5 plot (Voltage vs. datetime)
# Plotting routine for the time series graph; mutes any x-axis and y-axis labels
plot(as.numeric(course4Proj1$Voltage),xlab="dateline", ylab = "Voltage", type = "l", lwd = 1, xaxt="n", yaxt="n")

#  axis tick marks and "Thu", "Fri", and "Sat" labels put on x-axis.
axis(1, at=1,labels="Thu", las=1)
axis(1, at=1500,labels="Fri", las=1)
axis(1, at=2900,labels="Sat", las=1)

#  axis tick marks and 0,10,20,30 marks put on y-axis
axis(2, at=880, labels = "234", las = 2)
axis(2, at=1080, labels = "", las = 2)
axis(2, at=1280, labels = "238", las = 2)
axis(2, at=1480, labels = "", las = 2)
axis(2, at=1680, labels = "242", las = 2)
axis(2, at=1880, labels = "", las = 2)
axis(2, at=2080, labels = "246", las = 2)

#  Set up shrinkage scale for no over-size plotting in window
par(cex = 0.7)

#   Plot 3 plot
# Plotting routine for the time series graph; mutes any x-axis and y-axis labels
plot(as.numeric(course4Proj1$Sub_metering_1), col="gray", xlab="", ylab = "Energy sub metering", type = "l", lwd = 1, xaxt="n", yaxt="n")
lines(as.numeric(course4Proj1$Sub_metering_3), col="blue", type = "l", lwd = 1)
lines(as.numeric(course4Proj1$Sub_metering_2)/5, col="red", type = "l", lwd = 1)

#  axis tick marks and "Thu", "Fri", and "Sat" labels put on x-axis.
axis(1, at=1,labels="Thu", las=1)
axis(1, at=1500,labels="Fri", las=1)
axis(1, at=2900,labels="Sat", las=1)

#  axis tick marks and 0,10,20,30 marks put on y-axis
axis(2, at=1, labels = "0", las = 2)
axis(2, at=10, labels = "10", las = 2) 
axis(2, at=20, labels = "20", las = 2)
axis(2, at=30, labels = "30", las = 2)

#  Set up legend on plot 3
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("gray", "red", "blue"))

#  Re-size window for Plot 6
par(cex = 1)

#  Plot plot 6
# Plotting routine for the time series graph; mutes any x-axis and y-axis labels
plot(as.numeric(course4Proj1$Global_reactive_power),xlab="dateline", ylab = "Global_reactive_power", type = "l", lwd = 1, xaxt="n", yaxt="n")

#  axis tick marks and "Thu", "Fri", and "Sat" labels put on x-axis.
axis(1, at=1,labels="Thu", las=1)
axis(1, at=1500,labels="Fri", las=1)
axis(1, at=2900,labels="Sat", las=1)

#  axis tick marks and 0.0 to 0.5 on the y=axis
axis(2, at=3, labels = "0.0", las = 2)
axis(2, at=47, labels = "0.1", las = 2)
axis(2, at=91, labels = "0.2", las = 2)
axis(2, at=135, labels = "0.3", las = 2)
axis(2, at=179, labels = "0.4", las = 2)
axis(2, at=223, labels = "0.5", las = 2)

# Copy plot to plot4.png in the same directory.
dev.copy(png, file = "plot4.png")
dev.off()