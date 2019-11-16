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

# Create 2 rows and 2 columns for the plot
par(mfrow=c(2,2))

#Upper Left Plot
plot(plotData$Datetime,as.numeric(as.character(plotData$Global_active_power)),type="l",xlab="",ylab="Global Active Power") 

#Upper Right Plot
plot(plotData$Datetime,as.numeric(as.character(plotData$Voltage)),type="l",xlab="datetime",ylab="Voltage") 

#Lower Left Plot
plot(plotData$Datetime, plotData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotData$Datetime, plotData$Sub_metering_2,col="red")
lines(plotData$Datetime, plotData$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

#Lower Right Plot
plot(plotData$Datetime,as.numeric(as.character(plotData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")