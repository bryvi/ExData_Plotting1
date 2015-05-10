
epc0 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=7)

epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

epc12 <- subset(epc,as.Date(Date,"%d/%m/%Y")=="2007/02/01"|as.Date(Date,"%d/%m/%Y")=="2007/02/02")
 
length(epc12$Sub_metering_1)
length(epc12$Sub_metering_2)
length(epc12$Sub_metering_3)

length(!is.na(epc12$Sub_metering_1))
length(!is.na(epc12$Sub_metering_2))
length(!is.na(epc12$Sub_metering_3))

gap12$secs <- as.numeric(strptime(paste(gap12$Date," ",gap12$Time),"%d/%m/%Y %H:%M:%S"))

startimehrs <- as.numeric(strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S"))/(60*60*24)

gap12$hours <- (gap12$secs/(60*60))-startimehrs

gap12$day <- gap12$hours/24

xlabel <- c("Thu","Fri","Sat")

png("plot3.png")

plot(gap12$day, gap12$Sub_metering_1, type="l", lty=1, axes=FALSE, ann=FALSE)
lines(gap12$day, gap12$Sub_metering_2, type = "l", lty=1, col = "red")
lines(gap12$day, gap12$Sub_metering_3, type = "l", lty=1, col = "blue")
mtext("Energy sub metering", side=2, line=3)
axis(1, 0:2, xlabel[1:3])
axis(2, seq(0,30,10))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
box()
dev.off()


