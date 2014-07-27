##Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year)
##load the ggplot2 package
library(ggplot2)
##Extract the data considering Baltimore
NEI_Baltimore<-subset(NEI,fips=="24510")
sums_Baltimore<-aggregate(NEI_Baltimore$Emissions,list(NEI_Baltimore$type,
                                                       NEI_Baltimore$year),sum)
names(sums_Baltimore)<-c("Type","Year","PM2.5_emission_in_Tons")

##open the png device and plot
png("plot3.png")
qplot(Year,PM2.5_emission_in_Tons,data=sums_Baltimore,facets=.~Type)
dev.off()

