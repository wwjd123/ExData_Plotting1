Sys.setlocale("LC_TIME", "English")
Data_colname <- read.table("household_power_consumption.txt", sep=";", nrow=1, colClasses = "character")
Data <- read.table("household_power_consumption.txt", sep=";", skip=65000, nrow=5000)
colnames(Data) <- Data_colname[1,]

Data$Time <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")
inTime <- Data$Time >= "2007-02-01" & Data$Time < "2007-02-03"
inData <- Data[inTime,]

par(mfcol=c(2,2), bg="white")
with(inData, {plot(Time, Global_active_power, type="l", ylab = "Global Active Power")
              plot(Time, Sub_metering_1, type="l", ylab = "Energy sub metering") 
              points(Time, Sub_metering_2, col="red", type="l")
              points(Time, Sub_metering_3, col="blue", type="l")
              legend("topright", legend = colnames(inData)[7:9], lty=1, 
                     col=c("black","red","blue"))
              plot(Time, Voltage, type="l", ylab="Voltage", xlab="datetime")
              plot(Time, Global_reactive_power, type="l", ylab="Global_reactive_power",
                   xlab="datetime")})
dev.copy(png, file = "plot4.png")
dev.off()