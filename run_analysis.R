## The purpose of this project is to demonstrate the ability to collect, work 
## with, and clean a data set.

## This R script does the following...

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.

## Load necessary packages
library(dplyr)      
library(lubridate)

## Download the data
dataFileName <- "GCD Week 4 Project.zip"

## Checks if data set files are already saved
if(!file.exists(dataFileName)) {
        ## File link name
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        ##downloads files if conditions are met
        download.file(fileURL, dataFileName, method = "curl")
}

## Checks for if folder exists
if(!file.exists("UCI HAR Dataset")) {
        ##unzips file if conditions are met
        unzip(dataFileName)
}

## Reading and Naming the different data frames into objects
##Reading and Naming Activities File
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))
##Reading and Naming Data Features File
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","Functions"))
##Training Data Files
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Functions)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
##Test Data Files
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Functions)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

## 1. Merges the training and the test sets to create one data set
## row binds x values
xValues <- rbind(xTrain, xTest)   
## row binds y values
yValues <- rbind(yTrain, yTest)          
## row binds subject data
subjects <- rbind(subjectTrain, subjectTest)
## column binds subject info, y, and x values
mergedData <- cbind(subjects, yValues, xValues)

## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement. 
## creates merged data table of only mean and std data
tidyData <- mergedData %>% select(Subject, Code, contains("mean"), contains("std"))

## 3. Uses descriptive activity names to name the activities in the data set
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

## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
tidyDataSet <- tidyData %>%
        group_by(Subject, Activity) %>%     ##organizes data for final average
        summarise_all(funs(mean))      ##computes final mean for tidy data set
## Writes final tidy data set
write.table(tidyDataSet, "TidyDataSet.txt", row.names = FALSE)