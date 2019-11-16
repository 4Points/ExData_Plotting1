#Load Libraries
library(dplyr)
library(lubridate)

#Read Data into variable
rawData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Filter Data by dates  greater than 2007-02-01 and less than 2007-02-02
plotData <- filter(rawData, as.Date(rawData$Date, format = "%d/%m/%Y") >= "2007-02-01" & as.Date(rawData$Date,format = "%d/%m/%Y") <= "2007-02-02")

#Create the Datetime field from the Date and Time Columns
plotData$Date2 <- as.Date(plotData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plotData$Date2), plotData$Time)
plotData$Datetime <- as.POSIXct(datetime)

#Create Plot 2
plot(plotData$Datetime,as.numeric(as.character(plotData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 