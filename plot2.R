# Script called plot2.R for the Exploratory Data Analysis Course Project 1.

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

## To get Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file in the working directory
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
