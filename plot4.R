dataFile   <- "./DATA/household_power_consumption.txt" 
data       <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reading data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007")) #subset data

datetime            <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #changing the formats of date and time
globalActivePower   <- as.numeric(subsetData$Global_active_power)      #changing string to numeric
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)    #changing string to numeric
voltage             <- as.numeric(subsetData$Voltage)                  #changing string to numeric
subMetering1        <- as.numeric(subsetData$Sub_metering_1)           #changing string to numeric
subMetering2        <- as.numeric(subsetData$Sub_metering_2)           #changing string to numeric
subMetering3        <- as.numeric(subsetData$Sub_metering_3)           #changing string to numeric



png("plot4.png", width=480, height=480) #opening png graphic device

par(mfrow = c(2, 2)) #changing the layout of graphic device

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) #code for 1st plot

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")                        #code for 2nd plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")                #code for 3rd plot
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")  #code for 4th plot

dev.off() #closing the png graphic device
