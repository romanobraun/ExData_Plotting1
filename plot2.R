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
png(file="graph2.png", width = 480, height = 480)
# Creating plot 2:
with(findata, plot(daytime, as.numeric(as.character(Global_active_power)), xlab =" ", ylab = "Global Active Power", type ="l"))
# Closing device
dev.off()
