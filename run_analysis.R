file <- "data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI Dataset"
results <- "results"

#Install package
install.packages("plyr")
library(plyr)

#Create files 
download.file(url,file, mode = "wb")
dir.create(results)


getTable <- function (filename,cols = NULL){
    
    f <- unz(file, paste(data_path,filename,sep="/"))
    data <- data.frame()
    if(is.null(cols)){
        data <- read.table(f,sep="",stringsAsFactors=F)
    } else {
        data <- read.table(f,sep="",stringsAsFactors=F, col.names= cols)
    }
    
    
    data
    
}

#Read data
getData <- function(type, features){
        
    subject_data <- getTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
    y_data <- getTable(paste(type,"/","y_",type,".txt",sep=""),"activity")    
    x_data <- getTable(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
    
    return (cbind(subject_data,y_data,x_data)) 
}


saveResult <- function (data,name){
    
    file <- paste(results, "/", name,".csv" ,sep="")
    write.csv(data,file)
}


features <- getTable("features.txt")

# load
train <- getData("train",features)
test <- getData("test",features)

# merge & arrange
data <- rbind(train, test)
data <- arrange(data, id)
activity_labels <- getTable("activity_labels.txt")
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)


#Get mean and std. 
dataset1 <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
saveResult(dataset1,"dataset1")

## Data set 2 
dataset2 <- ddply(dataset1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(dataset2)[-c(1:2)] <- paste(colnames(dataset2)[-c(1:2)], "_mean", sep="")

# Save DT2
saveResult(dataset2,"dataset2")
