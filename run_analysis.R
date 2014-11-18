#data.table ???
library(data.table)

#Download zip archive and unzip it into data folder
if (!file.exists("data")) dir.create("data")

zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipPath <- "data/project.zip"
if (!file.exists(zipPath)) download.file(zipURL, destfile = zipPath, method = "curl")
dataDir <- "data/UCI HAR Dataset"
if (!file.exists(dataDir)) unzip(zipPath, exdir="data")
list.files(dataDir)    

featuresPath <- paste(dataDir, '/features.txt',sep="")
features <- as.character(read.table(featuresPath)[,2])
featuresMSNrs <- grep("(mean\\()|(std)", features, perl = T)
#features[featuresMSNrs]

activityPath <- paste(dataDir, '/activity_labels.txt',sep="")
activity <- as.character(read.table(activityPath)[,2])

#training data
subTrPath <- paste(dataDir, '/train/subject_train.txt',sep="")
subTr <- read.table(subTrPath)
yTrPath <- paste(dataDir, '/train/y_train.txt',sep="")
yTr <- read.table(yTrPath)
yTr <- sapply(yTr, function(a) activity[a])

xTrPath <- paste(dataDir, '/train/X_train.txt',sep="")
xTr <- read.table(xTrPath)[,featuresMSNrs]

tidyData <- cbind(subTr,yTr,xTr)
colnames(tidyData) <- c("subject","activity",features[featuresMSNrs])
head(tidyData)

#test data
subTePath <- paste(dataDir, '/test/subject_test.txt',sep="")
subTe <- read.table(subTePath)
yTePath <- paste(dataDir, '/test/y_test.txt',sep="")
yTe <- read.table(yTePath)
yTe <- sapply(yTe, function(a) activity[a])

xTePath <- paste(dataDir, '/test/X_test.txt',sep="")
xTe <- read.table(xTePath)[,featuresMSNrs]

tidyData2 <- cbind(subTe,yTe,xTe)
colnames(tidyData2) <- c("subject","activity",features[featuresMSNrs])
tidyData <- rbind(tidyData,tidyData2)

write.table(tidyData, file = "data/tidyData.txt")









