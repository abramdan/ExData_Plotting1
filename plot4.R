currentDir <- dirname(sys.frame(1)$ofile)
setwd(currentDir)

load("data.Rda")


png("plot4.png", width = 640, height = 480)
par(mfrow = c(2, 2))

## Fig 1
plot(inputData$DateTime, inputData$Global_active_power, type = "n", main = "", 
     xlab = "", ylab = "Global Active Power (kilowatts)") 
lines(inputData$DateTime, inputData$Global_active_power, type = 'l') 

## Fig 2
plot(inputData$DateTime, inputData$Voltage, type = "n", main = "", 
     xlab = "datetime", ylab = "Voltage") 
lines(inputData$DateTime, inputData$Voltage, type = 'l') 


## Fig 3
plot(inputData$DateTime, inputData$Global_active_power, type = "n", main = "", 
     xlab = "", ylab = "Energy sub metering", ylim=c(0, 40)) 
lines(inputData$DateTime, inputData$Sub_metering_1, type = 'l', col = "black") 
lines(inputData$DateTime, inputData$Sub_metering_2, type = 'l', col = "red") 
lines(inputData$DateTime, inputData$Sub_metering_3, type = 'l', col = "blue")

legend(x = 'topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c('black', 'red', 'blue'))


## Fig 4
plot(inputData$DateTime, inputData$Global_reactive_power, type = "n", main = "", 
     xlab = "datetime", ylab = "Global_reactive_power") 
lines(inputData$DateTime, inputData$Global_reactive_power, type = 'l') 

dev.off()

