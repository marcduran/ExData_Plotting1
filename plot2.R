library(sqldf)
Sys.setlocale("LC_TIME","en_US.utf8")

filename <- "./data/household_power_consumption.txt"
twodays <- read.csv.sql(filename, sql = "select * from file
                        where Date in ('1/2/2007', '2/2/2007')", sep = ";")

# This is the code for Plot2
par(ps = 10, mfcol = c(1,1))
twodays$DateTime <- strptime(paste(twodays$Date, " ", twodays$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
with(twodays, plot(DateTime, Global_active_power, type = "l",  
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "Plot2.png") 
dev.off()