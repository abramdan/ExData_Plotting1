currentDir <- dirname(sys.frame(1)$ofile)
setwd(currentDir)

load("data.Rda")
png("plot3.png", width = 640, height = 480)

plot(inputData$DateTime, inputData$Global_active_power, type = "n", main = "", 
     xlab = "", ylab = "Energy sub metering", ylim=c(0, 40)) 
lines(inputData$DateTime, inputData$Sub_metering_1, type = 'l', col = "black") 
lines(inputData$DateTime, inputData$Sub_metering_2, type = 'l', col = "red") 
lines(inputData$DateTime, inputData$Sub_metering_3, type = 'l', col = "blue")

legend(x = 'topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c('black', 'red', 'blue'))

dev.off()

