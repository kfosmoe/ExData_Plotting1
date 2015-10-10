powerfile = "C:/Users/Kristofer/Courses/EDA_Data_Analysis/household_power_consumption.txt"
powerdata = read.table(powerfile, header = T, sep =";", na.strings ="?")

#convert the Date variable to a Date Object
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#select the subset for Dates 2007-02-01 and 2007-02-02
subset <- powerdata[which (powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02"), ]

#removes NA values
subset <- na.omit(subset)

#draw a histogram to the screen device
hist(subset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#copy to a png file
dev.copy(png, file = "plot1.png")
dev.off()
