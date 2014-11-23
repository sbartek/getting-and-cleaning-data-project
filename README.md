Getting and Cleaning Data Course Project 
========================================

# Introduction #

## Purpose ##


The purpose of this project is to demonstrate ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can
be used for later analysis. The data represent data collected from the
accelerometers from the Samsung Galaxy S smartphone. A full
description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project: 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Objectives ##

The objective of this project is to create R script called
`run_analysis.R` that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation
   for each measurement.
3. Uses descriptive activity names to name the activities in the data
   set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy
   data set with the average of each variable for each activity and
   each subject.


## Contents ##

This repo contains the following files:

* `run_analysis.R` the script that downolad data and create tidy data sets
* ` CodeBook.md` text file that describes the variables, the data, and 
  transformations performed to clean up the data
* ` README.md` which is this file

# The script #

## Downloading data ##

The first part of the script downloads data and unzip into 'data'
folder which is created if does not exist.

## Reading features and activites ##

Then the script reads features and activites. After that it prepares
features for extracting only the measurements on the mean and standard
deviation. It also cleans it from symbols like '-()'.

## Extracting data ##

Since the data is divided between training and testing we have to
extract it twice. We also appropriately label the data set with descriptive
variable names taken from features.

## Merges the training and the test sets ##

Then we merge data into one table and save them into `data/tidyData.txt` file.

## Second tidy set ##

Creates a second, independent tidy data set with the average of each
variable for each activity and each subject and save them into `data/tidyData.txt`

## Columns description ##

Creates file `data/variables.md` with description of variables.
