

#set working directory

setwd("~/Data_Science/Exploratory_Data_Analaysis/Course_assignment2/exdata_data_NEI_data")

#read data
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Load ggplot2 library
library(plyr) 
library(reshape2)
library(ggplot2)

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland(MD)
# Los Angeles County, California(CA)
MD.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregate
MD.DF <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.DF) <- c('year', 'Emissions')
MD.DF$City <- paste(rep('Baltimore,MD', 4))

CA.DF <- aggregate(CA.onroad[, 'Emissions'], by=list(CA.onroad$year), sum)
colnames(CA.DF) <- c('year', 'Emissions')
CA.DF$City <- paste(rep('Los Angeles, CA', 4))

MD_CA_DF <- as.data.frame(rbind(MD.DF, CA.DF))

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

# Generate the graph in the same directory as the source code
png('plot6.png', width=640, height=480)

    ggplot(data=MD_CA_DF, aes(x=year, y=Emissions, group=Emissions, color=City)) + 
      geom_point( aes(color = City), size=4) + xlab("Year") + ylab("Changes in Emissions ") +
      ggtitle("PM2.5 Emissions Changes from Motor Vehicle Sources: Baltimore vs. LA")+geom_text(aes(label=round(Emissions,digits = 2)), size = 4,color="black", hjust=1.5, vjust=1.5)
      
dev.off()