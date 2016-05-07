
#set working directory
      
      setwd("~/Data_Science/Exploratory_Data_Analaysis/Course_assignment2/exdata_data_NEI_data")

#read data
      
      if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
      }
      if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
      }

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

      subsetNEI  <- NEI[NEI$fips=="24510", ]
      
      TotalPM25inBaltimoreByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
      
      png('plot2.png')
      barplot(height=TotalPM25inBaltimoreByYear$Emissions, names.arg=TotalPM25inBaltimoreByYear$year, col="red",ylim = c(0,3500),
              xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM2.5 Emissions in Baltimore City by Year'))
      dev.off()
      