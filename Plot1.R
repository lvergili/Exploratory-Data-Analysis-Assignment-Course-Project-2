
#set working directory
     
      setwd("~/Data_Science/Exploratory_Data_Analaysis/Course_assignment2/exdata_data_NEI_data")

#read Data
     
      if(!exists("NEI")){
      NEI <- readRDS("summarySCC_PM25.rds")
      }
      if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
      }

# Question:Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
# for each of the years 1999, 2002, 2005, and 2008.
     
      #Subsetting data 
      
      TotalPM25ByYear <- aggregate(Emissions ~ year, NEI, sum)
      
      #Plotting with base plotting system and save as png file
     
     png('plot1.png',width=480,height=480,units="px",bg="transparent")
              
              barplot(height=TotalPM25ByYear$Emissions, names.arg=TotalPM25ByYear$year, xlab="years", 
              ylab=expression('total PM'[2.5]*' emission'),
              main=expression('Total PM2.5 Emissions From All US Sources by Year'),col="blue",ylim = c(0e+00,8e+06) )
    
    dev.off()
      
      
      