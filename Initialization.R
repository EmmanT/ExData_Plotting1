# Check if source data exists
if (!file.exists("./data/household_power_consumption.txt")) {
  download.file("http://j.mp/TbC79E", "./data/power_data.zip", method = "wget")
  unzip("./data/power_data.zip", overwrite = T, exdir = "./data")
}

#Invoke a system command
system("head -n 1 ./data/household_power_consumption.txt > ./data/feb2007data.txt")
system("cat ./data/household_power_consumption.txt  | grep '^0\\{0,1\\}[12]/0\\{0,1\\}2/2007' >> ./data/feb2007data.txt")

#Read the data into the 2007 data
datafile <- "./data/feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

#perform dates conversion when necessary
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


# Call, generate and save Plot 1 into a png file
source("plot1.R")

# Call, generate and save Plot 2 into a png file
source("plot2.R")

# Call, generate and save Plot 3 into a png file
source("plot3.R")

# Call, generate and save Plot 4 into a png file
source("plot4.R")
