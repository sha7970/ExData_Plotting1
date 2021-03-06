setwd("~/Desktop/module4")
#reading dataset
consumption <- read.csv("household_power_consumption.txt", 
                        skip=66637,
                        nrows=2880,
                        na.strings = "?",
                        header=F,
                        sep=";")
names(consumption) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
consumption$DateTime <- as.POSIXct(paste(consumption$Date, consumption$Time, sep=" "), 
                                   format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480)
plot(consumption$DateTime, 
     consumption$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(consumption$DateTime, consumption$Sub_metering_2, col="red")
lines(consumption$DateTime, consumption$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
