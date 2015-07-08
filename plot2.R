#Load Data
temporal_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
head(temporal_data)

#Extract only date at 2007-02-01 and 2007-02-02
temporal_data.1<-temporal_data[temporal_data[,1]=="1/2/2007",]
temporal_data.2<-temporal_data[temporal_data[,1]=="2/2/2007",]
head(temporal_data.1)
head(temporal_data.2)
data<-rbind(temporal_data.1,temporal_data.2)
head(data)

#Convert to Date
temporal_Time <- paste(data$Date,data$Time,sep="|")
head(temporal_Time)
data.date<- strptime(temporal_Time, "%d/%m/%Y|%H:%M:%S")
head(data.date)


#plot2

plot(data.date, as.numeric(data$Global_active_power), type="l",xlab="",ylab="Global Active Power (Kilowatts)")

dev.copy(png,"plot2.png",width=480,height=480)
dev.off
