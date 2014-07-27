##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
sums<-aggregate(NEI$Emissions,list(NEI$year),sum)
names(sums)<-c("year","Total_PM2.5_Emissions")
png(file="plot1.png")
with(sums,plot(year,Total_PM2.5_Emissions,main="Total Yearly PM2.5 Emissions",
               xlab="year",ylab="Total emission(Tons)"))
dev.off()