library(data.table)
DT <- fread("../household_power_consumption.txt", na.strings=c('?'))
DT <- DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007")]
DT$Global_active_power <- as.numeric(DT$Global_active_power)
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)

x <- strptime(paste(DT$Date, DT$Time), format="%e/%m/%Y %H:%M:%S")




par(mfrow = c(2,2))
plot(x, DT$Global_active_power, type="l", main="", ylab="Global Active Power", xlab="")

plot(x,DT$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(x, DT$Sub_metering_1, type="l", main="", ylab="Energy Sub Metering", xlab="")
lines(x, DT$Sub_metering_2, col="red")
lines(x, DT$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(x,DT$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")



dev.copy(png, file="figure/plot4.png")
dev.off()

