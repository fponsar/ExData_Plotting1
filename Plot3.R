## Project 1 Plot 3

## Download zip file from web page if it has not been download yet and unzip.

FileZip <- "household_power_consumption.zip"
if(!file.exists("household_power_consumption.zip")){
     download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", FileZip)
     unzip(FileZip,"household_power_consumption.txt")
}

## Read data into memory, subset data of interest,convert to numeric

hpc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",colClasses="character")
hpc12 <-subset(hpc,(Date=="1/2/2007")|(Date=="2/2/2007"))
hpc12$Global_active_power <- as.numeric(hpc12$Global_active_power)
hpc12$Sub_metering_1 <- as.numeric(hpc12$Sub_metering_1)
hpc12$Sub_metering_2 <- as.numeric(hpc12$Sub_metering_2)
hpc12$Sub_metering_3 <- as.numeric(hpc12$Sub_metering_3)


## Convert the Date and Time variables to Date/Time classes


DateTime <- strptime(paste(hpc12$Date,hpc12$Time), format = "%d/%m/%Y %H:%M:%S")
hpc12 <-cbind(hpc12,DateTime)
Sys.setlocale("LC_TIME", "C")

## Open png device, create line graph "plot3.png" in directory, close png device

png(filename = "plot3.png") 
with(hpc12,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering"))
with(hpc12,lines(DateTime,Sub_metering_2,col="red"))
with(hpc12,lines(DateTime,Sub_metering_3,col="blue"))
legend(x="topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()
