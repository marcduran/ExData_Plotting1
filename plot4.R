library(sqldf)
Sys.setlocale("LC_TIME","en_US.utf8")

filename <- "./data/household_power_consumption.txt"
twodays <- read.csv.sql(filename, sql = "select * from file
                        where Date in ('1/2/2007', '2/2/2007')", sep = ";")

# This is the code for Plot4
twodays$DateTime <- strptime(paste(twodays$Date, " ", twodays$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
par(mfcol = c(2,2), mar = c(4, 4, 1, 1), ps = 10)
with(twodays, {
    # plot 1
    plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    # plot 2
    plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(DateTime, Sub_metering_1, type = "l", col = "black")
    points(DateTime, Sub_metering_2, type = "l", col = "red")
    points(DateTime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = "solid", bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # plot 3
    plot(DateTime, Voltage, type = "l", xlab = "datetime") 
    # plot 4
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.copy(png, file = "Plot4.png") 
dev.off()