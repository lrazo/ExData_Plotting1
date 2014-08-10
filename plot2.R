require(sqldf)
plot2  <- function(filename = "household_power_consumption.txt"){
    df <- read.csv.sql(fileName, "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";", header = T)
    df <- within(df,{timestamp=strptime(paste(Date,Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")})
    png(filename = "plot2.png")
    plot(df$timestamp, df$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(df$timestamp, df$Global_active_power)
    dev.off()
}