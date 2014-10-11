library(sqldf)
Sys.setlocale("LC_TIME","en_US.utf8")

filename <- "./data/household_power_consumption.txt"
twodays <- read.csv.sql(filename, sql = "select * from file
                        where Date in ('1/2/2007', '2/2/2007')", sep = ";")

# This is the code for Plot3
par(ps = 10, mfcol = c(1,1), mar = c(4.1, 4.1, 2.1, 2.1))
twodays$DateTime <- strptime(paste(twodays$Date, " ", twodays$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
with(twodays, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(twodays, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(twodays, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(twodays, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = "solid",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot3.png") 
dev.off()