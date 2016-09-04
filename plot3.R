## This function loads data and plots a graph and saves it to a png
## part of the - Exploratory Data Analysis course - PLOT3.R
## 
## by Erik Pinter

plot3 <- function(x) {
        
        print("Plot3 in progress...")  
        
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
        png(filename = "plot3.png", width = 480, height = 480, units = "px")
        
        plot(dat$NewTime, dat$Sub_metering_1, type = "n") 
        plot(dat$NewTime, dat$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="black")
        lines(dat$NewTime, dat$Sub_metering_2, type = "l", xlab="", col="red")
        lines(dat$NewTime, dat$Sub_metering_3, type = "l", xlab="", col="blue")
        legend("topright", lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
        
        
        ## save the histogram as png
        dev.off()
        
        print("Plot3 saved as plot3.png")
        
}
