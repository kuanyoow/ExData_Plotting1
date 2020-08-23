##load library
library(data.table)
library(dplyr)

## load dataset using fread function from data.table
dat <- fread("C:/R_scripts/course4 EDA/household_power_consumption.txt")

## convert Date column from "character" class to "Date" class and take a subset
## of dates between 2007/02/01 - 2007/02/02
dat <- dat %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
sdat <- dat[Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")]

## convert Time column from "character" class to "time"
sdat <- sdat %>% mutate(date_time = strptime(paste(Date, Time), 
                                             format = "%Y-%m-%d %H:%M:%S"))

## plotting figure and saving it as "plot2.png"
png(filename = "plot2.png", width = 480, height = 480, unit = "px")
plot(sdat$date_time, sdat$Global_active_power, type = "l", xlab = "", ylab = 
       "Global Active Power (kilowatts)")
dev.off()