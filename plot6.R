##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
##extract the vehicle related data
SCC_vehicles<-subset(SCC,Data.Category=='Onroad')$SCC
NEI_vehicle<-subset(NEI,NEI$SCC %in% SCC_vehicles)
NEI_vehicle_Baltimore<-subset(NEI_vehicle,NEI_vehicle$fips=="24510")
NEI_vehicle_LA<-subset(NEI_vehicle,NEI_vehicle$fips=="06037")
sums_Baltimore<-aggregate(NEI_vehicle_Baltimore$Emissions,
                          list(NEI_vehicle_Baltimore$year),sum)
sums_LA<-aggregate(NEI_vehicle_LA$Emissions,list(NEI_vehicle_LA$year),sum)
par(mfrow=c(1,2))
names(sums_Baltimore)<-c("year","emissions")
names(sums_LA)<-c("year","emissions")
png("plot6.png")
plot(sums_Baltimore$year,sums_Baltimore$emissions,
               main="Baltimore",
               xlab="year",ylab="Emission(Tons)")
plot(sums_LA$year,sums_LA$emissions,
                   main="LA",
                   xlab="year",ylab="Emission(Tons)")
dev.off()