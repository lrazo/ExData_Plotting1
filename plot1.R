require(sqldf)
plot1  <- function(filename = "household_power_consumption.txt"){
    df <- read.csv.sql(fileName, "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";", header = T)
    df$Date<-as.Date(df$Date,format = "%d/%m/%Y")
    png(filename = "plot1.png")
    hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
    dev.off()
}