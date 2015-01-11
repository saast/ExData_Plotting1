library(data.table)
DT <- fread("../household_power_consumption.txt", na.strings=c('?'))
DT <- DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007")]
DT$Global_active_power <- as.numeric(DT$Global_active_power)


x <- strptime(paste(DT$Date, DT$Time), format="%e/%m/%Y %H:%M:%S")
plot(x, DT$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="figure/plot2.png")
dev.off()

