
    #set working directory
    
    setwd("~/Data_Science/Exploratory_Data_Analaysis/Course_assignment2/exdata_data_NEI_data")
    
    #read data
            if(!exists("NEI")){
              NEI <- readRDS("summarySCC_PM25.rds")
            }
            if(!exists("SCC")){
              SCC <- readRDS("Source_Classification_Code.rds")
            }
    
    library(ggplot2)
    
    #Question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
    
    #subsetting data for emissions coming from motor vehicles for Baltimore
            TotalPM25inBaltimoreOnRoad<- subset(NEI, fips == 24510 & type == 'ON-ROAD')
            
    #aggregate data by year
              TotalPM25inBaltimoreOnRoadByYear<- aggregate(Emissions ~ year,TotalPM25inBaltimoreOnRoad , sum)
    
    #Plotting with ggplot2 plotting system and save as png file  
    
    png("plot5.png", width=640, height=480)
          ggplot(data=TotalPM25inBaltimoreOnRoadByYear, aes(x=year, y=Emissions)) + geom_line(col="red") + geom_point( size=4, shape=21, fill="white",col="red") +
                xlab("Year") + ylab("Emissions (tons)") + 
                ggtitle(expression("Emissions from Motor Vehicle Sources in Baltimore"))
               
          
    dev.off()