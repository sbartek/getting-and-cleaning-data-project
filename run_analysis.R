if (!file.exists("data")) dir.create("data")
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipPath <- "data/project.zip"
if (!file.exists(zipPath)) download.file(zipURL, destfile = zipPath, method = "curl")
if (!file.exists("data/UCI HAR Dataset")) unzip(zipPath, exdir="data")
    
