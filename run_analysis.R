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

tidyDataTe <- cbind(subTe,yTe,xTe)
colnames(tidyDataTe) <- c("subject","activity",msFeats)

# Merges the training and the test sets to create one data set.
tidyData <- rbind(tidyData,tidyDataTe)

#We change subject into factor
tidyData[,1] <- as.factor(tidyData[,1])


# This writes them into 'tidyData.txt' file
# It will take a while:
write.table(tidyData, file = "data/tidyData.txt")

#Creates a second, independent tidy data set with the average of each
#variable for each activity and each subject and saves in 'tidyData2.txt'

tidyData2 <- aggregate(
    x =  tidyData[,msFeats],
    by=list(subject=tidyData[,"subject"], activity=tidyData[,"activity"]),
    FUN="mean")
write.table(tidyData, file = "data/tidyData2.txt")

#
# This is extra. It creates description of variables in markdown format. 
#


lines <- c("**subject**",
           "Identifier of a volunteer. There are 30 volunteers within an age bracket of 19-48 year", " ")

lines <- c(lines, "**activity**",
           "One of six activities: WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING", " ")

desc <- function(feat) {
    line <- ""
    mms <- regexpr("mean|std", feat, perl=TRUE)
    ms <- regmatches(feat, mms)
    if (ms=='mean') {
        line <- paste0(line,"Mean of")
    } else {
        line <- paste0(line,"Standard deviation of")
    }
    mm <- regexpr("Mag", feat, perl=TRUE)
    if (mm[1]!= -1) {
        line <- paste(line,"the magnitude of")
    } 
    mtf <- regexpr("^.", feat, perl=TRUE)
    tf <- regmatches(feat, mtf)
    if (tf=='t') {
        line <- paste(line,"time domain")
    } else {
        line <- paste(line, "Fast Fourier Transform (FFT) of")
    }
    mj <- regexpr("Jerk", feat, perl=TRUE)
    if (mj[1]!= -1) {
        line <- paste(line,"Jerk signals")
    } else {
        line <- paste(line,"signals")
    }
        
    mag <- regexpr("Acc|Gyro", feat, perl=TRUE)
    ag <- regmatches(feat, mag)
    if (ag=='Acc') {
        line <- paste(line,"from accelerometer")
        mbg <- regexpr(c("Body|Gravity"), feat, perl=TRUE)
        bg <- regmatches(feat, mbg)
        if (bg=='Gravity') {
            line <- paste(line,"in standard gravity units")
        } else {
            line <- paste(line, "subtracting the gravity")
        }
    } else {
        line <- paste(line, "from gyroscope")
    }
    md <- regexpr(c("[XYZ]$"), feat, perl=TRUE)
    d <- regmatches(feat, md)
    if (md!=-1) {
        line <- paste(line, "in ", d, "direction")
    } 
    line <- paste0(line, ".")
    line
}

for (feat in msFeats) {
    lines <- c(lines, paste0("**", feat, "**"), desc(feat), " ")
}

fileConn<-file("data/variables.md")

writeLines(lines, fileConn)
close(fileConn)



