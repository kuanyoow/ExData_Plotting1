##load library
library(data.table)
library(dplyr)

## load dataset using fread function from data.table
dat <- fread("C:/R_scripts/course4 EDA/household_power_consumption.txt")

## convert Date column from "character" class to "Date" class and take a subset
## of dates between 2007/02/01 - 2007/02/02
dat <- dat %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
sdat <- dat[Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")]

## convert Global_acive_power column as numeric and plot histogram
sdat <- sdat %>% mutate(Global_active_power = as.numeric(Global_active_power))
png(filename = "plot1.png", width = 480, height = 480, unit = "px")
hist(sdat$Global_active_power, col = "red", xlab = 
  "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()