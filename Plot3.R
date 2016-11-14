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

## Plot3

columnlines <- c("black", "red", "blue")

labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(Plot1Data$SetTime, Plot1Data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")

lines(Plot1Data$SetTime, Plot1Data$Sub_metering_2, col=columnlines[2])

lines(Plot1Data$SetTime, Plot1Data$Sub_metering_3, col=columnlines[3])

legend("topright", legend=labels, col=columnlines, lty="solid")