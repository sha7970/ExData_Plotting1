setwd("~/Desktop/module4")
#reading dataset
consumption <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")

names(consumption) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%y")
consumption$Time <- strptime(consumption$Time, format="%H:%M:%S")

#plot graph
png(filename="plot1.png", width=480, height=480)
hist(consumption$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
