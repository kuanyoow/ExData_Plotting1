##load library
library(data.table)
library(dplyr)

## the zipped file was uncompressed and stored at a seperate folder
## load dataset using fread function from data.table
dat <- fread("C:/R_scripts/course4 EDA/household_power_consumption.txt")

## convert Date column from "character" class to "Date" class and take a subset
## of dates between 2007/02/01 - 2007/02/02
dat <- dat %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
sdat <- dat[Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")]

## convert Time column from "character" class to "time"
sdat <- sdat %>% mutate(date_time = strptime(paste(Date, Time), 
                                             format = "%Y-%m-%d %H:%M:%S"))

## set up multiple figure plot and saving it in "plot4.png"
png(filename = "plot4.png", width = 480, height = 480, unit = "px")
par(mfcol = c(2, 2))

## plotting top left graph
plot(sdat$date_time, sdat$Global_active_power, type = "l", xlab = "", ylab = 
       "Global Active Power")

## plotting bottom left graph
plot(sdat$date_time, sdat$Sub_metering_1, type = "l", xlab = "", ylab = 
       "Energy sub metering")
lines(sdat$date_time, sdat$Sub_metering_2, type = "l", col = "red")
lines(sdat$date_time, sdat$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = 
         c("black", "red", "blue"), lty = c(1, 1, 1))

## plotting top right graph
plot(sdat$date_time, sdat$Voltage, type = "l", xlab = "datetime", ylab =
       "Voltage")

## plotting bottom right graph
plot(sdat$date_time, sdat$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

## close and save "plot4.png"
dev.off()