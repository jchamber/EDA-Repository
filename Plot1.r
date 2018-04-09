dataFile <- "./Users/johnchamberlin/Chris Work/Coursera-Exploratory-Data-Analysis/household_energy_consumption.txt"
#Reading, naming and subsetting energy consumption data
energy <- read.table("household_energy_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_energy","Global_reactive_energy","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subenergy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")
#calling the basic plot function
hist(as.numeric(as.character(subenergy$Global_active_energy)),col="red",main="Global Active energy",xlab="Global Active energy(kilowatts)")
# annotating graph
title(main="Global Active energy")
png(plot1.png, width=480, height=480)