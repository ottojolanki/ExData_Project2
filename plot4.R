##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
NEI$SCC<-as.character(NEI$SCC)
##subset the coal related data and plot
coalrelated<- grep("Coal",SCC$Short.Name)
coalSCCs<-SCC$SCC[coalrelated]
coalSCCs<as.character(coalSCCs)
NEI_coal<-subset(NEI,NEI$SCC %in% coalSCCs)
sums<-aggregate(NEI_coal$Emissions,list(NEI_coal$year),sum)
names(sums)<-c("Year","Total_coal_related_emissions")
png("plot4.png")
with(sums,plot(Year,Total_coal_related_emissions,main="Total Yearly coal related emissions",
               xlab="year",ylab="Emission(Tons)"))
dev.off()