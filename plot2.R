#Following R-code plots the time series plot (plot #2) in the assignment, and 
#stores the plot in a png file.  It reads the household_power_consumption.txt
#file from the same directory that the R-code is in, and then plots out the
#time-series plot and then stores the plot into a png file, called plot2.png.

library(date)


# read in data from household_power_consumption.txxt from same directory
power <- read.table("household_power_consumption.txt",sep =";", header = T)

#subset in the two days worth of data
course4Proj1a <- subset(power, Date == "1/2/2007")
course4Proj1b <- subset(power, Date == "2/2/2007")

#bind those 2 days' worth of data together.
#Calculate active power to scale.
course4Proj1 <- rbind(course4Proj1a, course4Proj1b)
course4Proj1$Global_active_power <- as.numeric(course4Proj1$Global_active_power)/500

# Plotting routine for the time series graph; mutes any x-axis label
plot(course4Proj1$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", type="l")

#  axis tick marks and "Thu", "Fri", and "Sat" labels put on x-axis.
axis(1, at=1,labels="Thu", las=1)
axis(1, at=1500,labels="Fri", las=1)
axis(1, at=2900,labels="Sat", las=1)

# Copy plot to plot2.png in the same directory.
dev.copy(png, file = "plot2.png")
dev.off()