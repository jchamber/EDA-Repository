# Open file put data in energy, naming and subsetting energy consumption data
energy <- read.table("household_energy_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_energy","Global_reactive_energy","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subenergy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subenergy$Date <- as.Date(subenergy$Date, format="%d/%m/%Y")
subenergy$Time <- strptime(subenergy$Time, format="%H:%M:%S")
subenergy[1:1440,"Time"] <- format(subenergy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subenergy[1441:2880,"Time"] <- format(subenergy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# initiating a composite plot with many graphs
par(mfrow=c(2,2))
# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subenergy,{
  plot(subenergy$Time,as.numeric(as.character(subenergy$Global_active_energy)),type="l",  xlab="",ylab="Global Active energy")  
  plot(subenergy$Time,as.numeric(as.character(subenergy$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subenergy$Time,subenergy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subenergy,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subenergy$Time,as.numeric(as.character(subenergy$Global_reactive_energy)),type="l",xlab="datetime",ylab="Global_reactive_energy")
})
