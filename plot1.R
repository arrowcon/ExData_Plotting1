#Following R-code plots the first histogram in the assingment, and 
#stores the plot in a png file.  It reads the household_power_consumption.txt
#file from the same directory that the R-code is in, and then plots out the
#histogram and then stores the plot into a png file, called plot1.png.

# read in data from household_power_consumption.txxt from same directory
power <- read.table("household_power_consumption.txt",sep =";", header = T)

#subset in the two days worth of data
course4Proj1a <- subset(power, Date == "1/2/2007")
course4Proj1b <- subset(power, Date == "2/2/2007")

#bind those 2 days' worth of data together.
course4Proj1 <- rbind(course4Proj1a, course4Proj1b)
course4Proj1$Global_active_power <- as.numeric(course4Proj1$Global_active_power)/500

#Plot histogram per specification
hist(as.numeric(course4Proj1$Global_active_power), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#Copy file to a png file in same directory, called plot1.png
dev.copy(png, file = "plot1.png")
dev.off()
