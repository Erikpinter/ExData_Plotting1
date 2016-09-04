## This function loads data and plots a graph and saves it to a png
## part of the - Exploratory Data Analysis course - PLOT1.R
## 
## by Erik Pinter

plot1 <- function(x) {
        
        print("Plot1 in progress...")
        
        ## loading the data
        # set col classes to speed up loading
        cc <- c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
        
        # read csv to data frame "dat"
        dat <- read.csv("household_power_consumption.txt",sep = ";" , colClasses = cc, na.strings = "?") 
        dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
        
        #filter data between the specified dates
        dat <- subset(dat, dat$Date >= "2007-02-01")
        dat <- subset(dat, dat$Date <= "2007-02-02")
        
        dat$Time <- strptime(dat$Time, "%H:%M:%S")
        
        
        ## plot the histogram
        png(filename = "plot1.png", width = 480, height = 480, units = "px")
        hist(dat$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab ="Frequency")
        
        
        ## save the histogram as png
        dev.off()
        print("Plot1 saved as plot1.png")
        
}
