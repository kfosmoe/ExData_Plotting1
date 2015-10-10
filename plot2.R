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

#create the png plot 2
png(file = "plot2.png")
plot(subset$datetime, subset$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
