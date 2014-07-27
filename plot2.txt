##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
##Extract the data from measurements in Baltimore to a separate dataframe
NEI_Baltimore<-subset(NEI,fips=="24510")
sums_Baltimore<-aggregate(NEI_Baltimore$Emissions,list(NEI_Baltimore$year),sum)
names(sums_Baltimore)<-c("year","Total_PM2.5_Emissions")
png("plot2.png")
with(sums_Baltimore,plot(year,Total_PM2.5_Emissions,main="Total Yearly PM2.5 
                         Emissions in Baltimore",xlab="year",
                         ylab="Total emissions(Tons)"))
dev.off()
