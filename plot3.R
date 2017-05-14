energy_usage <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
energy_usage <- subset(energy_usage,Date=="1/2/2007" | Date=="2/2/2007")
energy_usage <- transform(energy_usage,Global_active_power=as.numeric(as.character(energy_usage$Global_active_power)))
energy_usage <- transform(energy_usage,Date=paste(Date,Time))
energy_usage<- transform(energy_usage,Date=strptime(Date,"%d/%m/%Y %H:%M:%S"))
energy_usage <- subset(energy_usage,select = -Time)



png(file ="plot3.png",bg="transparent")
plot(energy_usage$Date,energy_usage$Sub_metering_1,bg="transparent",type = "l",ylab = "Energy sub metering",xlab = "",yaxt= "n")
with(energy_usage,lines(Date,Sub_metering_2,col="red"))
with(energy_usage,lines(Date,Sub_metering_3,col="blue"))
axis(2,at=c(0,10,20,30))
legend("topright", col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1))
dev.off()


