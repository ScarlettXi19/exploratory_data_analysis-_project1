#download the data and unzip it manually
#hate to write the directions

#read data
filename<-"household_power_consumption.txt"
data<-read.table(text=grep('[1,2]/2/2007',readLines(filename),value=TRUE),,sep=';',na.strings = '?')
colnames(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))             




#plot4
png(filename='plot4.png',width=480,height=480,units = 'px')
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, x_lab = '', y_lab = 'Global Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, x_lab = 'datetime', y_lab = 'Voltage', type = 'l')
plot(data$DateTime, data$Sub_metering_1, x_lab = '', y_lab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()