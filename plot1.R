currentDir <- dirname(sys.frame(1)$ofile)
setwd(currentDir)

load("data.Rda")
png("plot1.png", width = 640, height = 480)
hist(inputData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col = "red")
dev.off()
