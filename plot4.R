
  hpc<-read.table("C:\\Users\\61710499\\Desktop/Coursera - EDA\\Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",sep = ";",stringsAsFactors = F)
  hpc_colnames<-as.character(hpc[1,])
  colnames(hpc)<-hpc_colnames
  hpc<-hpc[-1,]
  hpc$Date<-as.Date(hpc$Date,format = "%d/%m/%Y")
  hpc$Time<-format(strptime(hpc$Time,format = "%H:%M:%S"),format = "%H:%M:%S")
  hpc<-with(hpc,hpc[(Date>= "2007-02-01" & Date<="2007-02-02"),])
  str(hpc)
  summary(hpc)
  hpc$DateTime<-as.POSIXct(paste(hpc$Date,hpc$Time))
  
  #plot 4
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(hpc$DateTime,as.numeric(hpc$Global_active_power),type = "l", xlab = "",ylab = "Global Active Power")
plot(hpc$DateTime,as.numeric(hpc$Voltage),type = "l",xlab = "datetime",ylab = "Voltage")
plot (hpc$DateTime,as.numeric(hpc$Sub_metering_1),type = "l", xlab = "",ylab = "Energy Sub Metering")
lines(hpc$DateTime,as.numeric(hpc$Sub_metering_2),type = "l",col = "red")
lines(hpc$DateTime,as.numeric(hpc$Sub_metering_3),type = "l",col = "blue")
legend("topright",legend = colnames(hpc[,7:9]),col=c("black","red","blue"),lty=1,lwd=2)
plot(hpc$DateTime,as.numeric(hpc$Global_reactive_power),type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()