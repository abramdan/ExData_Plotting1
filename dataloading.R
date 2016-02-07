## This is the code that downloads the data, unzips, reads, saves the needed
## part of it
currentDir <- dirname(sys.frame(1)$ofile)
setwd(currentDir)
urlPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

zipFile <- "power_consumption.zip"
download.file(urlPath, zipFile)
unzip(zipFile)
uzFile <- unzip(zipFile, list = TRUE)
uzFileName <- uzFile[1]$Name
rawData <- read.csv(uzFileName, sep = ';', na.strings = '?')
rawDataDate <- as.Date(rawData$Date, "%d/%m/%Y")
rDDateTime <- as.POSIXlt(paste(rawDataDate, rawData$Time), format="%Y-%m-%d %H:%M:%S")
rawData <- rawData[, 3:9]
rawData$DateTime <- rDDateTime

inputData <- rawData[which(rDDateTime$year == 107 & rDDateTime$mon == 1 & rDDateTime$mday <= 2), ]
save(inputData, file = "data.Rda")
