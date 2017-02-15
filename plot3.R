
# Getting the data
# If running for the first time will download and extract the data file

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file1 <- file.path(getwd(),"DataAnalysis.zip")

if (!file.exists(file1)){
  download.file(URL,file1)
}

if (!file.exists("DataAnalysis")) { 
  unzip("DataAnalysis.zip") 
}

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Set up the data for plotting
Submeter_1 <- as.numeric(data$Sub_metering_1)
Submeter_2 <- as.numeric(data$Sub_metering_2)
Submeter_3 <- as.numeric(data$Sub_metering_3)
DateTime <- strptime(paste(data$Date,data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")


# Plot the graph and save as "*.png"
png("plot3.png",width = 480,height = 480)
plot(DateTime,Submeter_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(DateTime,Submeter_2,col = "red")
lines(DateTime,Submeter_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 1,col = c("black","red","blue"))
dev.off()