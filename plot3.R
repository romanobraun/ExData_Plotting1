# Define working directry
getwd() # Check work directory
newwd <- "/Users/romanbraun/Dropbox (Privat)/Coursera/expl_data" # Working directory containing dataset
newwd
setwd(newwd) # Set working directory to newwd
getwd()

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
head(data)
findata <- subset(data, Date =="1/2/2007" | Date == "2/2/2007")
head(findata)
dim(findata)

# Transform Date and Time to one Column daytime
# head(weekdays(as.Date(findata$Date, "%d/%m/%Y")))
findata$daytime <- as.POSIXct(paste(findata$Date, findata$Time), "%d/%m/%Y %H:%M:%S", tz = "EST")

head(findata)
table(findata$day)
# Defining graph output file
png(file="graph3.png", width = 480, height = 480)
# Creating plot 3:
with(findata, plot(daytime, as.numeric(as.character(Sub_metering_1)), xlab =" ", ylab = "Energy sub metering", type ="l"))
lines(findata$daytime, as.numeric( as.character(findata$Sub_metering_2)), col="red")
lines(findata$daytime, as.numeric( as.character(findata$Sub_metering_3)), col="blue")
# Insert legend:
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
# Closing device
dev.off()
