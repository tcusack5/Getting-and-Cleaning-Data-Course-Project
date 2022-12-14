# Getting-and-Cleaning-Data-Course-Project
Repository for Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Included in this repository is... 
1) A tidy data set as described below.
2) A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md. 
4) A README.md with the used scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Steps Performed by the run_analysis.R file...
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R scipt...

## Loading necessary packages.
library(dplyr)      
library(lubridate)

## Downloading the data.
dataFileName <- "GCD Week 4 Project.zip"

## Checks if data set files are already saved and downloads if necessary.
if(!file.exists(dataFileName)) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, dataFileName, method = "curl")
}

## Checks for if file folder exists and unzips if necessary.
if(!file.exists("UCI HAR Dataset")) {
        unzip(dataFileName)
}

## Reading and Naming the Features and Activity ata frames into objects.

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","Functions"))
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Functions)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Functions)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

## 1. Merges the training and the test sets to create one data set row binds x values.
xValues <- rbind(xTrain, xTest)   

## Row binds y values.
yValues <- rbind(yTrain, yTest)   

## Row binds subject data.
subjects <- rbind(subjectTrain, subjectTest)

## Column binds subject info, y, and x values.
mergedData <- cbind(subjects, yValues, xValues)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
tidyData <- mergedData %>% select(Subject, Code, contains("mean"), contains("std"))

## 3. Uses descriptive activity names to name the activities in the data set.
tidyData$Code <- activities[tidyData$Code, 2]

## 4. Appropriately labels the data sets with descriptive variable names.
names(tidyData)[2] = "Activity"
names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
names(tidyData)<-gsub("^t", "Time", names(tidyData))
names(tidyData)<-gsub("tBody", "TimeBody", names(tidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
names(tidyData)<-gsub("angle", "Angle", names(tidyData))
names(tidyData)<-gsub("gravity", "Gravity", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
names(tidyData)<-gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "Standard Deviation", names(tidyData), ignore.case = TRUE)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataSet <- tidyData %>%
        group_by(Subject, Activity) %>%     
        summarise_all(funs(mean))      
        
## Writes final tidy data set.
write.table(tidyDataSet, "TidyDataSet.txt", row.names = FALSE)
