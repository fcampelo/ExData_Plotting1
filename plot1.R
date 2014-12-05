#Exploratory Data Analysis
## Project 01
### plot1.png

# Load and precondition data
data<-read.table("household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.strings=c("?","NA","NaN"),
                 nrows=2100000)

data2<-data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data2$Date<-as.Date(factor(data2$Date),format="%d/%m/%Y")
data2$Time<-strptime(data2$Time,format="%X")

rm("data")


# Generate Plot 1: 
# Histogram of Global Active Power

# Open graphics device
png(filename = "plot1.png",
    width=480,
    height=480,
    units="px",
    bg="transparent")

# Plot histogram (with a few tweaks to 
# reproduce the target figure)
with(data2,
     hist(Global_active_power,
          col=2,
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)",
          ylab="Frequency"
          )
     )

# Close graphics device
dev.off()