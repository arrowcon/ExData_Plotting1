#Following R-code plots the time series plot (plot #3) in the assignment, and 
#stores the plot in a png file.  It reads the household_power_consumption.txt
#file from the same directory that the R-code is in, and then plots out the
#time-series plot and then stores the plot into a png file, called plot3.png.

library(date)

# read in data from household_power_consumption.txxt from same directory
power <- read.table("household_power_consumption.txt",sep =";", header = T)

#subset in the two days worth of data
course4Proj1a <- subset(power, Date == "1/2/2007")
course4Proj1b <- subset(power, Date == "2/2/2007")

#bind those 2 days' worth of data together.
course4Proj1 <- rbind(course4Proj1a, course4Proj1b)

# Plotting routine for the time series graph; mutes any x-axis and y-axis labels
# plot sub-metering 1, 2, 3 time series on plot.
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

#   Put legend inside graph
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1), col = c("gray", "red", "blue"))

# Copy plot to plot3.png in the same directory.
dev.copy(png, file = "plot3.png")
dev.off()