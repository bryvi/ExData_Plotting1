
epc0 <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=7)

epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

epc12 <- subset(epc,as.Date(Date,"%d/%m/%Y")=="2007/02/01"|as.Date(Date,"%d/%m/%Y")=="2007/02/02")
              
gap12 <- epc12[!is.na(epc12$Global_active_power),]

png("plot1.png")
hist(gap12$Global_active_power, col="red", xaxt="n", xlim=range(seq(0,6,2)),
     xlab="Global Active Power (kilowatts)",main="Histogram of Global Active Power")
axis(1,seq(0,6,2))
axis(2,seq(0,1200,200))
dev.off()