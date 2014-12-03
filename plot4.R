#Exploratory Data Analysis
## Project 01
### plot4.png

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


# Generate Plot 4: 
# 4 panel figure containing:
# Time series, Global Active Power
# Time series, Voltage
# Energy sub metering, stratified
# Time series, Global reactive power

# Open graphics device
png(filename = "plot4.png",
    width=480,
    height=480,
    units="px",
    bg="transparent")

# Setup 4 panes
par(mfrow=c(2,2))

# First plot (Time series, Global Active Power)
with(data2,{
    plot(x=seq_along(Global_active_power),
         y=Global_active_power,
         type="l",
         main="",
         ylab="Global Active Power",
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

# Second plot (Time series, Voltage)
with(data2,{
    plot(x=seq_along(Voltage),
         y=Voltage,
         type="l",
         main="",
         ylab="Voltage",
         xlab="datetime",
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

# Third plot (Time Series of Energy Sub Metering)
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

# Fourth plot (Time Series, Global reactive power)
with(data2,{
    plot(x=seq_along(Global_reactive_power),
         y=Global_reactive_power,
         type="l",
         main="",
         xlab="timedate",
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