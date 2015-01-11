library(data.table)
DT <- fread("../household_power_consumption.txt", na.strings=c('?'))
DT <- DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007")]
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)


x <- strptime(paste(DT$Date, DT$Time), format="%e/%m/%Y %H:%M:%S")

plot(x, DT$Sub_metering_1, type="l", main="", ylab="Energy Sub Metering", xlab="")
lines(x, DT$Sub_metering_2, col="red")
lines(x, DT$Sub_metering_3, col="blue")

legend("topright", lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))



dev.copy(png, file="figure/plot3.png")
dev.off()

