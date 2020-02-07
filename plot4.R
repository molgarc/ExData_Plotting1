#Plot 4: Plot in a 2x2 panel 4 figures -> Plot 2, plot 3, Voltage for Thursday and Friday and GLobal Reactive POwer for Thursday and Friday
data <- read.table("data/household_power_consumption.txt",header=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep =";",stringsAsFactors=FALSE, dec=".")
#Extract Data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power) 
subSetData$Global_reactive_power <- as.numeric(subSetData$Global_reactive_power) 
subSetData$Voltage <- as.numeric(subSetData$Voltage) 
subSetData$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1) 
subSetData$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2) 
subSetData$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3) 
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  
plot(datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(datetime, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(datetime, subSetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subSetData$Sub_metering_2, type="l", col="red") 
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
plot(datetime, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.off() 