f <- unz("data/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
d <- read.delim( f, sep=";" )
t <- as.POSIXct(d$Date, format="%d/%m/%Y")

d <- subset(d, t >= "2007-2-1" & t <= "2007-2-2")
t <- as.POSIXct(paste( d$Date, d$Time ), format="%d/%m/%Y %H:%M:%S" )

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# plot 1
plot(t,d$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")

# plot 2
plot(t,d$Voltage,type="l",xlab="datetime", ylab="Voltage")

# plot 3
plot(t,d$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(t,d$Sub_metering_2,col="red")
lines(t,d$Sub_metering_3,col="blue")
legend("topright", bty="n", col = c("black","red","blue"), lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot 4
plot(t,d$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()