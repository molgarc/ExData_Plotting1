#Plot 1: Red histogram (Each 0.5 Kilowatts Global Active Power)
#Read txt
data <- read.table("data/household_power_consumption.txt",header=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep =";",stringsAsFactors=FALSE, dec=".")
#Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power) 
#Extract Data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",] 
png("plot1.png", width=480, height=480) 
hist(subSetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",xlim=c(0,6),ylim=c(0,1200)) 
dev.off()