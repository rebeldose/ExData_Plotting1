dataFile <- "./DATA/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reading data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007")) #subset data

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #changing the formats of date and time
globalActivePower <- as.numeric(subsetData$Global_active_power) #changing string to numeric

png("plot2.png", width=480, height=480) #opening png graphic device
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") #plotting the data
dev.off() #closing the png graphic device