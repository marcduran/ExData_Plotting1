library(sqldf)
Sys.setlocale("LC_TIME","en_US.utf8")

filename <- "./data/household_power_consumption.txt"
twodays <- read.csv.sql(filename, sql = "select * from file
                        where Date in ('1/2/2007', '2/2/2007')", sep = ";")

# This is the code for Plot1
par(ps = 10, mfcol = c(1,1))
with(twodays, hist(Global_active_power, main = "Global Active Power", freq = TRUE, 
            xlab = "Global Active Power (kilowatts)", breaks = 16, col = "red"))
# Some y-axis labels at tick marks are missing, they refuse to show up >>> FIXED!!!
dev.copy(png, file = "Plot1.png") 
dev.off()