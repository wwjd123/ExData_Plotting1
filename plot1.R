Sys.setlocale("LC_TIME", "English")
Data_colname <- read.table("household_power_consumption.txt", sep=";", nrow=1, colClasses = "character")
Data <- read.table("household_power_consumption.txt", sep=";", skip=65000, nrow=5000)
colnames(Data) <- Data_colname[1,]

Data$Time <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
inTime <- Data$Time >= "2007-02-01" & Data$Time < "2007-02-03"
inData <- Data[inTime,]

par(mfcol = c(1,1), bg = "white")
hist(inData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()