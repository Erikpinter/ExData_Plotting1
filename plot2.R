## This function loads data and plots a graph and saves it to a png
## part of the - Exploratory Data Analysis course - PLOT2.R
## 
## by Erik Pinter

plot2 <- function(x) {
        
        print("Plot2 in progress...")  
        
        ## loading the data
        # set col classes to speed up loading
        cc <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric") # setting colClasses
        
        # read csv to data frame "dat"
        dat <- read.csv("household_power_consumption.txt",sep = ";" , colClasses = cc, na.strings = "?", stringsAsFactors=TRUE) 
        
        # introduce a new column "NewTime", where date and time are combined 
        dat$NewTime <- strptime(paste(dat$Date, dat$Time),"%d/%m/%Y %H:%M:%S")
        
        #filter data between the specified dates
        dat <- dat[dat$NewTime >= "2007-02-01 00:00:00", ]
        dat <- dat[dat$NewTime <= "2007-02-02 24:00:00", ]
        
        
        ## plot the histogram
        png(filename = "plot2.png", width = 480, height = 480, units = "px")
        plot(dat$NewTime, dat$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
        
        
        ## save the histogram as png
        dev.off()
        print("Plot2 saved as plot2.png")
        
}
