setwd("D:/Users/eberkel/Documents/Trainingen/Data Science Toolbox/Exploratory Data Analysis/Assignment1") 

readRawData = 0;  # set to 1 if the raw data is to be read.
                  # This needs to be done ones in order to run the code

# Reads the original dataset and forms a smaller one with only the data that
# is used for this assignment. 
if (readRawData == 1) {
      data = read.table("household_power_consumption.txt", header = 1, sep = ";")
      dataUse = data[21997:24876,]      
      write.table(dataUse, file = "household_power_consumption_use.txt", sep = ";")
}

# Read the data and convert the dates and times
data = read.table("household_power_consumption_use.txt", header = 1, sep = ";") 
head(data)
data$Date = as.Date(data$Date,format='%d/%m/%Y')
x = paste(as.character(data$Date), data$Time)
dateTime = strptime(x, "%Y-%m-%d %H:%M:%S")
data$Time = strptime(data$Time,format='%H:%M:%S')
head(data)

# plot 2
plot(dateTime,as.numeric(data$Global_active_power),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()

