#Exploratory Data Analysis
## Project 01
### plot2.png

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


# Generate Plot 2: 
# Time Series of Global Active Power

# Open graphics device
png(filename = "plot2.png",
    width=480,
    height=480,
    units="px",
    bg="transparent")

# Plot time series (with a few tweaks to 
# reproduce the target figure)
with(data2,{
        plot(x=seq_along(Global_active_power),
             y=Global_active_power,
             type="l",
             main="",
             ylab="Global Active Power (kilowatts)",
             xlab="",
             xaxt="n"
        );
        axis(side=1,
             at=c(0,
                  min(which(weekdays(data2$Date)=="Friday")),
                  length(data2$Date)),
             labels=c("Thu","Fri","Sat")
             )
    }
)

# Close graphics device
dev.off()