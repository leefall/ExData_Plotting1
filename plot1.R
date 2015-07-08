

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
data.date <-as.Date(data[,1], format="%d/%m/%Y")
head(data.date)
data[,1] <- data.date

#Add column for days of week
weeks.days<-weekdays(data.date)
head(weeks.days)
mydata<-cbind(data,weeks.days)

head(mydata)

#Plot1
hist(as.numeric(mydata$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Copy to png

dev.copy(png,"plot1.png",width=480,height=480)
dev.off
