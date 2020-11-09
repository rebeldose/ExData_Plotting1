dataFile <- "./DATA/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #reading data
subsetData <- subset(data, Date %in% c("1/2/2007","2/2/2007")) #subsetting data
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y") #changing date format
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power) #string to numeric
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") #plotting histogram


