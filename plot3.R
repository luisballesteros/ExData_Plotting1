library(plyr)
library(dplyr)
library(data.table)
library(lubridate)
rm(list=ls())
# Create data folder if it does not exist
if (!file.exists("data")) {
  dir.create("data")
}
# Download file to local "data" folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method = "curl")
dateDownloaded <- date()
dateDownloaded 
# Unzip file in "data" directory
unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")
# Create a "Data Frame" with "fread" and select only the days of interest.
df_all <- fread("./data/household_power_consumption.txt", 
                na.strings = c("?",NA))
df <- subset(df_all, Date == "1/2/2007" | Date == "2/2/2007")
# Creates variable "date_time" as a union variable of "Date" and "Time" and
# converts it to date/time format.
# Transform "Date" to date with "lubridate" library
df$date_time <- paste(df$Date, df$Time)
df$date_time <- dmy_hms(df$date_time)
df$Date <- dmy(df$Date)
# Check "Data Frame" and delete data source from memory 
head(df)
str(df)
rm(df_all)
png(file="plot3.png")
with(df, {
  plot(date_time, Sub_metering_1, type="l", 
       ylab = "Energy Sub metering", xlab = "")
  lines(date_time, Sub_metering_2, col="red")
  lines(date_time, Sub_metering_3, col="blue")
})
legend("topright",  lty = 1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()