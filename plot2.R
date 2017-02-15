URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file1 <- file.path(getwd(),"DataAnalysis.zip")

if (!file.exists(file1)){
  download.file(URL,file1)
}

# If the dataset hasn't been extracted do it
if (!file.exists("DataAnalysis")) { 
  unzip("DataAnalysis.zip") 
}

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

GlobalActivePower <- as.numeric(data$Global_active_power)
DateTime <- strptime(paste(data$Date,data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480,height = 480)
plot(DateTime,GlobalActivePower,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
