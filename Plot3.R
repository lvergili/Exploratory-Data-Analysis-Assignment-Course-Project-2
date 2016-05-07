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
        
       # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
       # which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
       # Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
        
      #subset data for Baltimore
        subsetNEI  <- NEI[NEI$fips=="24510", ]
        
        TotalPM25inBaltimoreByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)
        
        #Plotting with ggplot2 plotting system and save as png file  
        
        png("plot3.png", width=640, height=480)
        g <- ggplot(TotalPM25inBaltimoreByYearAndType, aes(year, Emissions, color = type))
        g <- g + geom_line() +xlab("year") +ylab(expression('Total PM'[2.5]*" Emissions(in Tons)")) +
          ggtitle('Total PM2.5 Emissions from different sources in Baltimore City from 1999 to 2008')
        print(g)
        dev.off()  
        
        
