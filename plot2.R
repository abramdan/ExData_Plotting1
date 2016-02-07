currentDir <- dirname(sys.frame(1)$ofile)
setwd(currentDir)

load("data.Rda")
png("plot2.png", width = 640, height = 480)

plot(inputData$DateTime, inputData$Global_active_power, type = "n", main = "", 
     xlab = "", ylab = "Global Active Power (kilowatts)") 
lines(inputData$DateTime, inputData$Global_active_power, type = 'l') 

dev.off()
