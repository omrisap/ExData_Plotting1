energy_usage <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
energy_usage <- subset(energy_usage,Date=="1/2/2007" | Date=="2/2/2007")
energy_usage <- transform(energy_usage,Global_active_power=as.numeric(as.character(energy_usage$Global_active_powe)))
energy_usage <- transform(energy_usage,Date=paste(Date,Time))
energy_usage<- transform(energy_usage,Date=strptime(Date,"%d/%m/%Y %H:%M:%S"))
energy_usage <- subset(energy_usage,select = -Time)



png(file ="plot2.png",bg="transparent")
plot(energy_usage$Date,energy_usage$Global_active_power,bg="transparent",type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()


