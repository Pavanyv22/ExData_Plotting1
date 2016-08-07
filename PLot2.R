infile <- file.path(getwd(),"household_power_consumption.txt")
power_consumption <- read.table(infile,sep=";",header=TRUE)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
Dat <-power_consumption[(power_consumption$Date=="2007-02-01") | (power_consumption$Date=="2007-02-02"),]
Dat$Global_active_power <- as.numeric(as.character(Dat$Global_active_power))
Dat$Global_reactive_power <- as.numeric(as.character(Dat$Global_reactive_power))
Dat$Voltage <- as.numeric(as.character(Dat$Voltage))
Dat <- transform(Dat, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
Dat$Sub_metering_1 <- as.numeric(as.character(Dat$Sub_metering_1))
Dat$Sub_metering_2 <- as.numeric(as.character(Dat$Sub_metering_2))
Dat$Sub_metering_3 <- as.numeric(as.character(Dat$Sub_metering_3))


plot(Dat$timestamp,Dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())