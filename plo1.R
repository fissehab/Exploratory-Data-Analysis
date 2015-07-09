# Download data from the provided link by first checking if it has not been already downloaded

if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
    
    download.file(url,destfile = "data.zip")
    unzip("data.zip")
}

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

lapply(data, class)  # to see the class of the variables
# most od them are factors

#Changinging Date and Time to appropriate format and class

data$DateTime<-paste(data$Date, data$Time)

# Let's see the format and class of data$DateTime
data$DateTime[1:10]
class(data$DateTime)

#Let's use strptime to change DateTime to its appropriate format

data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Since we are  working with dates 2007-02-01 and 2007-02-02, let's extract the 
# corresponding values

start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,] # Data2 covers the dates 2007-02-01 and 2007-02-02.


## plot 1

png(file="plot1.png", width=480, height=480)

hist(as.numeric(as.character(data2$Global_active_power)), # note we used as.character and as numeric since
     # the variable is factor variable.
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()