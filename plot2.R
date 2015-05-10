
epc0 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=7)

epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

epc12 <- subset(epc,as.Date(Date,"%d/%m/%Y")=="2007/02/01"|as.Date(Date,"%d/%m/%Y")=="2007/02/02")
              
gap12 <- epc12[!is.na(epc12$Global_active_power),]

gap12$secs <- as.numeric(strptime(paste(gap12$Date," ",gap12$Time),"%d/%m/%Y %H:%M:%S"))

startimehrs <- as.numeric(strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S"))/(60*60*24)

gap12$hours <- (gap12$secs/(60*60))-startimehrs

gap12$day <- gap12$hours/24


xlabel <- c("Thu","Fri","Sat")

png("plot2.png")

plot(gap12$day, gap12$Global_active_power, type="l", lty=1, 
     axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
axis(1, 0:2, xlabel[1:3])
axis(2, seq(0,6,2))
box()
dev.off()

