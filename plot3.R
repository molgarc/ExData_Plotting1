#Plot 3: Plot 3  in one single figure for SubMetering 1,2 and 3 Values for Thursday and Friday
data <- read.table("data/household_power_consumption.txt",header=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep =";",stringsAsFactors=FALSE, dec=".")
#Extract Data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power) 
subSetData$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1) 
subSetData$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2) 
subSetData$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
#Create figure
png("plot3.png", width=480, height=480) 
plot(datetime, subSetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subSetData$Sub_metering_2, type="l", col="red") 
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 