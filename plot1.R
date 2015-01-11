library(data.table)
DT <- fread("../household_power_consumption.txt", na.strings=c('?'))
DT <- DT[(DT$Date == "1/2/2007" | DT$Date == "2/2/2007")]
DT$Global_active_power <- as.numeric(DT$Global_active_power)
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="figure/plot1.png")
dev.off()

