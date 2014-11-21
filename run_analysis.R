#data.table ???
#library(data.table)

#Downloads zip archive and unzip it into data folder
if (!file.exists("data")) dir.create("data")
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipPath <- "data/project.zip"
if (!file.exists(zipPath)) download.file(zipURL, destfile = zipPath, method = "curl")
dataDir <- "data/UCI HAR Dataset"
if (!file.exists(dataDir)) unzip(zipPath, exdir="data")

#Reads features and activites
featuresPath <- paste(dataDir, '/features.txt',sep="")
features <- as.character(read.table(featuresPath)[,2])

#Prepare features for extracting only the measurements on the mean and
#standard deviation.
msInds <- grep("(mean\\()|(std)", features, perl = T)
msFeats <- features[msInds]
msFeats <- gsub("[-\\(\\)]", "", msFeats)

activityPath <- paste(dataDir, '/activity_labels.txt',sep="")
activity <- as.character(read.table(activityPath)[,2])

#Reads training data and orginizes it
subTrPath <- paste(dataDir, '/train/subject_train.txt',sep="")
subTr <- read.table(subTrPath)
yTrPath <- paste(dataDir, '/train/y_train.txt',sep="")
yTr <- read.table(yTrPath)
#Uses descriptive activity names to name the activities in the data set
yTr <- sapply(yTr, function(a) activity[a])

xTrPath <- paste(dataDir, '/train/X_train.txt',sep="")
# This will take a while:
xTr <- read.table(xTrPath)[,msInds]

tidyData <- cbind(subTr,yTr,xTr)
#Appropriately labels the data set with descriptive variable names. 
colnames(tidyData) <- c("subject","activity",msFeats)

#Reads test data
subTePath <- paste(dataDir, '/test/subject_test.txt',sep="")
subTe <- read.table(subTePath)
yTePath <- paste(dataDir, '/test/y_test.txt',sep="")
yTe <- read.table(yTePath)
yTe <- sapply(yTe, function(a) activity[a])

xTePath <- paste(dataDir, '/test/X_test.txt',sep="")
# This will take a while:
xTe <- read.table(xTePath)[,msInds]

tidyData2 <- cbind(subTe,yTe,xTe)
colnames(tidyData2) <- c("subject","activity",msFeats)

# Merges the training and the test sets to create one data set.
tidyData <- rbind(tidyData,tidyData2)

# This writes them into 'tidyData.txt' file
# It will take a while:
write.table(tidyData, file = "data/tidyData.txt")

#Creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.

tidyData3 <- aggregate(
    x =  tidyData[,msFeats],
    by=list(subject=tidyData[,"subject"], activity=tidyData[,"activity"]),
    FUN="mean")
head(tidyData3[,c(1,2)])
