## Project 1 Plot 1

## Download zip file from web page if it has not been download yet and unzip.

FileZip <- "household_power_consumption.zip"
if(!file.exists("household_power_consumption.zip")){
     download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", FileZip)
     unzip(FileZip,"household_power_consumption.txt")
}

## Read data into memory, subset data of interest

hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",colClasses="character")
hpc12 <-subset(hpc,(Date=="1/2/2007")|(Date=="2/2/2007"))
hpc12$Global_active_power <- as.numeric(hpc12$Global_active_power)

## Open png device, create histogram "plot1.png" in directory, close png device

png(filename = "plot1.png") 
with(hpc12,hist(Global_active_power,col="red",main ="Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()
