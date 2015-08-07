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

png(filename="plot2.png", width=480, height=480)
plot(consumption$DateTime, 
     consumption$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()



