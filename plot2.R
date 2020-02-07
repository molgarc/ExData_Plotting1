#Plot 2: Plot Global Active Power Values for Thursday and Friday
data <- read.table("data/household_power_consumption.txt",header=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep =";",stringsAsFactors=FALSE, dec=".")
data$Global_active_power <- as.numeric(data$Global_active_power) 
#Extract Data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
png("plot2.png", width=480, height=480) 
plot(datetime,subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 