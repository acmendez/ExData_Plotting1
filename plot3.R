# Script called plot3.R for the Exploratory Data Analysis Course Project 1.

# Set working directory and loading the data
setwd('c:/Documents and Settings/Administrador/Mis documentos/EDA Course Project 1')
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## data samplig
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## to clean the memory
remove(alldata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## To get Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file in the working directory
dev.copy(png, file="plot3.png")
dev.off()