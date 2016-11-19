
## Cousera Exploratory Data - Assignment 1

## Pull data

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DLFile <- "household_power_consumption.zip"
HHFile <- "household_power_consumption.txt"

## look for data

if (!file.exists(HHFile)) {
  
  download.file(URL, DLFile)
  
  unzip(DLFile, overwrite = T, exdir = "./Data")

}

##

plotData <- read.table(HHFile, header=T, sep=";", na.strings="?")

## set time variable

Plot1Data <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(Plot1Data$Date, 
                         Plot1Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

Plot1Data <- cbind(SetTime, Plot1Data)

##

## Plot 1
png("plot1.png", width=480, height=480)

hist(Plot1Data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()