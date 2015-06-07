

# Generating and Save Plot 2 into a png file
png("plot2.png")
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()