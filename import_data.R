if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip", method = "curl")
dateDownloaded <- date()
# cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
#head(cameraData)
# na.strings 
unzip(zipfile = "./data/household_power_consumption.zip", exdir = "./data")