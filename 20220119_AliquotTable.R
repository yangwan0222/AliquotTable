rm(list = ls())

data1 <- read.csv("C:\\Users\\wanya\\Desktop\\Aliquot Original\\ALIQUOT_LIST_01_24_20.csv")
data2 <- read.csv("C:\\Users\\wanya\\Desktop\\Aliquot for Add\\EDT.csv")
data3 <- data2[-c(2:4,6:12,15,17)]

NoDelete <- seq(1, nrow(data3), 2)
data3 <- data3[NoDelete,]
colnames(data3) <- c("RID","EXAMDATE","PLAVOL","PLA","VID")

data3$RID <- as.integer(data3$RID)

months <- c(str_match(data3$EXAMDATE, "-\\s*(.*?)\\s*-")[,2])
months[months == 'Jan'] <- '1'
months[months == 'Feb'] <- '2'
months[months == 'Mar'] <- '3'
months[months == 'Apr'] <- '4'
months[months == 'May'] <- '5'
months[months == 'Jun'] <- '6'
months[months == 'Jul'] <- '7' 
months[months == 'Aug'] <- '8'
months[months == 'Sep'] <- '9'
months[months == 'Oct'] <- '10'
months[months == 'Nov'] <- '11'
months[months == 'Dec'] <- '12'
months[as.integer(months)<10] <- paste("0",months[as.integer(months)<10],sep = "")
year <- substring(data3$EXAMDATE,nchar(data3$EXAMDATE)-1,nchar(data3$EXAMDATE))
day <- substring(data3$EXAMDATE,1,nchar(data3$EXAMDATE)-7)
day[as.integer(day)<10] <- paste("0",day[as.integer(day)<10],sep = "")
data3$EXAMDATE <- paste("20",year,"-",months,'-',day,sep = "")

data3$PLAVOL <- as.double(substr(data3$PLAVOL,1,nchar(data3$PLAVOL)-4))
data3$PLA <- data3$PLA * -1
data3$VID <- as.integer(substr(data3$VID,1,nchar(data3$VID)-4))