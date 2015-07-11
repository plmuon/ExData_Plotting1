data <- read.csv("household_power_consumption.txt", sep=';',na.strings = c('?'), stringsAsFactors = FALSE)
data <- transform(data, Time = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data <- subset(data, Date >= "2007-2-1" & Date <= "2007-2-2")
png(file="Plot4.png")
# 4 plots
par(mfrow=c(2,2))
# top left
plot(data$Time, data$Global_active_power, type="l", xlab = "", ylab="Global Active Power")
# top right
plot(data$Time, data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
# bottom left
plot(data$Time, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
points(data$Time, data$Sub_metering_2, type="l", xlab = "", ylab = "Energy sub metering", col="red")
points(data$Time, data$Sub_metering_3, type="l", xlab = "", ylab = "Energy sub metering", col="blue")
legend("topright", lty=1, bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# bottom right
plot(data$Time, data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
