dataFile <- "./DATA/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reading data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007")) #subset data

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #changing the formats of date and time
globalActivePower <- as.numeric(subsetData$Global_active_power) #changing string to numeric
subMetering1 <- as.numeric(subsetData$Sub_metering_1)           #changing string to numeric
subMetering2 <- as.numeric(subsetData$Sub_metering_2)           #changing string to numeric
subMetering3 <- as.numeric(subsetData$Sub_metering_3)           #changing string to numeric

png("plot3.png", width=480, height=480)         #opening png graphic device
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") #plotting submetering1 w.r.t time.
lines(datetime, subMetering2, type="l", col="red")                         #plotting submetering2 w.r.t time.
lines(datetime, subMetering3, type="l", col="blue")                        #plotting submetering3 w.r.t time.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) #adding legend to plot
dev.off()       #closing png graphic device
