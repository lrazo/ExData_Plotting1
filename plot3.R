require(sqldf)
plot3  <- function(filename = "household_power_consumption.txt"){
    df <- read.csv.sql(fileName, "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";", header = T)
    df <- within(df,{timestamp=strptime(paste(Date,Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")})
    png(filename = "plot3.png")
    plot(df$timestamp,df$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "" )
    lines(df$timestamp, df$Sub_metering_1, col = "black")
    lines(df$timestamp, df$Sub_metering_2, col = "red")
    lines(df$timestamp, df$Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
    dev.off()
}