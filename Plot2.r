# Open file put data in energy, naming and subsetting energy consumption data
energy <- read.table("household_energy_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_energy","Global_reactive_energy","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subenergy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subenergy$Date <- as.Date(subenergy$Date, format="%d/%m/%Y")
subenergy$Time <- strptime(subenergy$Time, format="%H:%M:%S")
subenergy[1:1440,"Time"] <- format(subenergy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subenergy[1441:2880,"Time"] <- format(subenergy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# calling the basic plot function
plot(subenergy$Time,as.numeric(as.character(subenergy$Global_active_energy)),type="l",xlab="",ylab="Global Active energy (kilowatts)") 
# annotating grap h
title(main="Global Active energy Vs Time")
