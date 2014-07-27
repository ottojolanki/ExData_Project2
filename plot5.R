##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
##extract the vehicle related data
SCC_vehicles<-subset(SCC,Data.Category=='Onroad')$SCC
NEI_vehicle<-subset(NEI,NEI$SCC %in% SCC_vehicles)
NEI_vehicle_Baltimore<-subset(NEI_vehicle,NEI_vehicle$fips=="24510")
sums<-aggregate(NEI_vehicle_Baltimore$Emissions,list(NEI_vehicle_Baltimore$year),sum)
names(sums)<-c("year","Vehicle_related_emissions_in_Baltimore")
png("plot5.png")
with(sums,plot(year,Vehicle_related_emissions_in_Baltimore,
               main="Yearly vehicle related emissions in Baltimore",
               xlab="year",ylab="Emission(Tons)"))
dev.off()