library(dplyr)

#Read Data into variable
rawData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Filter Data by dates  greater than 2007-02-01 and less than 2007-02-02
plotData <- filter(rawData, as.Date(rawData$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(rawData$Date,format = "%d/%m/%Y") <= "2007-02-02")

#Create Plot 1
hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
