#Exploratory Data Analysis
## Project 01
### plot3.png

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


# Generate Plot 3: 
# Time Series of Energy Sub Metering (stratified)

# Open graphics device
png(filename = "plot3.png",
    width=480,
    height=480,
    units="px",
    bg="transparent")

# Plot time series (with a few tweaks to 
# reproduce the target figure)

# Define colors
cols <- c("black","red","blue")

# Plot
with(data2,{
    plot(x=seq_along(Sub_metering_1),
         y=Sub_metering_1,
         type="n",
         main="",
         ylab="Energy sub metering",
         xlab="",
         xaxt="n"
    );
    for (i in 1:3){
        lines(x=seq_along(Sub_metering_1),
              y=data2[,6+i],
              type="l",
              col=cols[i])
    };
    axis(side=1,
         at=c(0,
              min(which(weekdays(data2$Date)=="Friday")),
              length(data2$Date)),
         labels=c("Thu","Fri","Sat")
    );
    legend("topright",
           legend=names(data2)[7:9],
           col=cols,
           lty=1
           )
})

# Close graphics device
dev.off()