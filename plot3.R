powerfile = "C:/Users/Kristofer/Courses/EDA_Data_Analysis/household_power_consumption.txt"
powerdata = read.table(powerfile, header = T, sep =";", na.strings ="?")

#convert the Date variable to a Date Object
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#select the subset for Dates 2007-02-01 and 2007-02-02
subset <- powerdata[which (powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02"), ]

#removes NA values
subset <- na.omit(subset)

#create a column for datetime
subset$timetemp <- paste(subset$Date, subset$Time)
subset$datetime <- strptime(subset$timetemp, format = "%Y-%m-%d %H:%M:%S")

#create the png plot 3
png(file = "plot3.png")
plot(subset$datetime, subset$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab="") #create an empty plot
#add the submetering groups
points(subset$datetime, subset$Sub_metering_1, col="black", type = "l")
points(subset$datetime, subset$Sub_metering_3, col="blue", type = "l")
points(subset$datetime, subset$Sub_metering_2, col="red", type = "l")
#add the legend
legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
