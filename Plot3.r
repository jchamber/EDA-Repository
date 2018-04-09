# Open file, put data in energy, naming and subsetting energy consumption data
energy <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subenergy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")
# Change the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subenergy$Date <- as.Date(subenergy$Date, format="%d/%m/%Y")
subenergy$Time <- strptime(subenergy$Time, format="%H:%M:%S")
subenergy[1:1440,"Time"] <- format(subenergy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subenergy[1441:2880,"Time"] <- format(subenergy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# Plot that puppy...make it look good
plot(subenergy$Time,subenergy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# add the title
title(main="Energy sub-metering")
