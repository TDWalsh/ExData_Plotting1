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

## Plot4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(Plot1Data$SetTime, Plot1Data$Global_active_power, 
     type="l", col="green", xlab="", ylab="Global Active Power")
plot(Plot1Data$SetTime, Plot1Data$Voltage, 
     type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(Plot1Data$SetTime, Plot1Data$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(Plot1Data$SetTime, Plot1Data$Sub_metering_2, 
      type="l", col="red")
lines(Plot1Data$SetTime, Plot1Data$Sub_metering_3, 
      type="l", col="blue")
legend("topright", bty="n", legend=labels, 
       lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, 
     type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")