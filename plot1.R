
  hpc<-read.table("C:\\Users\\61710499\\Desktop/Coursera - EDA\\Week 1\\exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",sep = ";",stringsAsFactors = F)
  hpc_colnames<-as.character(hpc[1,])
  colnames(hpc)<-hpc_colnames
  hpc<-hpc[-1,]
  hpc$Date<-as.Date(hpc$Date,format = "%d/%m/%Y")
  hpc$Time<-format(strptime(hpc$Time,format = "%H:%M:%S"),format = "%H:%M:%S")
  hpc<-with(hpc,hpc[(Date>= "2007-02-01" & Date<="2007-02-02"),])
  str(hpc)
  summary(hpc)
  
  #plot 1
  png("plot1.png",width = 480,height = 480)
  hist(as.numeric(hpc$Global_active_power),main = "Global Active Power" ,xlab = "Global Active Power (kilowatts)",col = "red")
  dev.off()
  
  