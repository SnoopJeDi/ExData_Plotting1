f <- unz("data/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
d <- read.delim( f, sep=";" )
t <- as.POSIXct(d$Date, format="%d/%m/%Y")

d <- subset(d, t >= "2007-2-1" & t <= "2007-2-2")
t <- as.POSIXct(paste( d$Date, d$Time ), format="%d/%m/%Y %H:%M:%S" )

png(filename = "plot1.png", width = 480, height = 480)
hist(d$Global_active_power, col='red', xlab = "Global Active Power (kilowatts)", main ="Global Active Power" )
dev.off()