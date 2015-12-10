f <- unz("data/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
d <- read.delim( f, sep=";" )
t <- as.POSIXct(d$Date, format="%d/%m/%Y")

d <- subset(d, t >= "2007-2-1" & t <= "2007-2-2")
t <- as.POSIXct(paste( d$Date, d$Time ), format="%d/%m/%Y %H:%M:%S" )

png(filename = "plot3.png", width = 480, height = 480)
plot(t,d$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(t,d$Sub_metering_2,col="red")
lines(t,d$Sub_metering_3,col="blue")
legend("topright", bty="o", col = c("black","red","blue"), lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()