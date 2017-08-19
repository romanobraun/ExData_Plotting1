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

# Defining graph output file
png(file="graph1.png", width = 480, height = 480)
# Creating plot 1:
with(findata, hist(as.numeric(as.character(Global_active_power)), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", main ="Global Active Power"))
# Closing device
dev.off()
