---
title: "**Code Book**"
author: "Thomas Cusack"
date: "2022-12-15"
output: html_document
---
any transformations or work that you performed to clean up the data called CodeBook.md.

# **Human Activity Recognition Using Smartphones Data Set**
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Introduction
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.The goal is to prepare tidy data that can be used for later analysis.

## The Data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Set Files

*features.txt* - List of features for data.

*features_info.txt* - Information on variables measured.

*activity_labels.txt* - List of activities from which data was collected.

*train/y_train.txt* - Training data set labels.

*train/X_train.txt* - Training data set.

*test/y_test.txt* - Test data set labels.

*test/X_test.txt* - Test data set.

### How The Data Was Collected
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Variables
The following variables were used to properly identify and label the data from the experiment:

### The Identifiers

*Subject* - ID number used to designate data for a specific individual

*Activity* - Type of activity performed from which data was collected

Activities from which data was collected:

- Walking: Subject walking

- Walking_Upstairs: Subject walking up staircase

- Walking_Downstairs: Subject walking down staircase

- Sitting: Subject sitting

- Standing: Subject standing

- Laying: Subject laying

### The Features

- *t*: time domain signal

- *Acc*: acceleration signal

- *Gyro*: gyroscope signal

- *Jerk*: jerk signal obtained from linear acceleration and angular velocity

- *Mag*: magnitude of signal

- *XYZ*: 3-axial signals in the X, Y, Z directions

- *f*: fast Fourier transform of the signal

- *mean()*: statistical mean applied to the time domain signal

- *std()*: standard deviation of the time domain signal

- *Body*: results from human movement

- *Gravity*: results from gravitational force

### Complete list of data measured needed for tidy data Set relating to mean and standard deviation utilizing features definitions.

- tBodyAccMeanX

- tBodyAccMeanY

- tBodyAccMeanZ

- tBodyAccStdX

- tBodyAccStdY

- tBodyAccStdZ

- tGravityAccMeanX

- tGravityAccMeanY

- tGravityAccMeanZ

- tGravityAccStdX

- tGravityAccStdY

- tGravityAccStdZ

- tBodyAccJerkMeanX

- tBodyAccJerkMeanY

- tBodyAccJerkMeanZ

- tBodyAccJerkStdX

- tBodyAccJerkStdY

- tBodyAccJerkStdZ

- tBodyGyroMeanX

- tBodyGyroMeanY

- tBodyGyroMeanZ

- tBodyGyroStdX

- tBodyGyroStdY

- tBodyGyroStdZ

- tBodyGyroJerkMeanX

- tBodyGyroJerkMeanY

- tBodyGyroJerkMeanZ

- tBodyGyroJerkStdX

- tBodyGyroJerkStdY

- tBodyGyroJerkStdZ

- tBodyAccMagMean

- tBodyAccMagStd

- tGravityAccMagMean

- tGravityAccMagStd

- tBodyAccJerkMagMean

- tBodyAccJerkMagStd

- tBodyGyroMagMean

- tBodyGyroMagStd

- tBodyGyroJerkMagMean

- tBodyGyroJerkMagStd

- fBodyAccMeanX

- fBodyAccMeanY

- fBodyAccMeanZ

- fBodyAccStdX

- fBodyAccStdY

- fBodyAccStdZ

- fBodyAccMeanFreqX

- fBodyAccMeanFreqY

- fBodyAccMeanFreqZ

- fBodyAccJerkMeanX

- fBodyAccJerkMeanY

- fBodyAccJerkMeanZ

- fBodyAccJerkStdX

- fBodyAccJerkStdY

- fBodyAccJerkStdZ

- fBodyAccJerkMeanFreqX

- fBodyAccJerkMeanFreqY

- fBodyAccJerkMeanFreqZ

- fBodyGyroMeanX

- fBodyGyroMeanY

- fBodyGyroMeanZ

- fBodyGyroStdX

- fBodyGyroStdY

- fBodyGyroStdZ

- fBodyGyroMeanFreqX

- fBodyGyroMeanFreqY

- fBodyGyroMeanFreqZ

- fBodyAccMagMean

- fBodyAccMagStd

- fBodyAccMagMeanFreq

- fBodyBodyAccJerkMagMean

- fBodyBodyAccJerkMagStd

- fBodyBodyAccJerkMagMeanFreq

- fBodyBodyGyroMagMean

- fBodyBodyGyroMagStd

- fBodyBodyGyroMagMeanFreq

- fBodyBodyGyroJerkMagMean

- fBodyBodyGyroJerkMagStd

- fBodyBodyGyroJerkMagMeanFreq


## Transformations
This project does the following with the data...

### 1. Merges the training and the test sets to create one data set.

*train/subject_train.txt* & *test/subject_test.txt* - Subject ID's are merged together into a data frame for manipulation.

*train/X_train.txt* & *test/X_test.txt* - X-Values are merged together into a data frame for data manipulation.

*train/y_train.txt* & *test/y_test.txt* - Y-Values are merged together into a data frame for data manipulation.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
The *features.txt* file is read and only the measurements correlating to mean and standard deviation are extracted into a data frame for manipulation.

### 3. Uses descriptive activity names to name the activities in the data set.
Extracted data from the *feaures.txt* is utilized to descriptively label the measured activities.

### 4. Appropriately labels the data set with descriptive variable names. 
Descriptive names for the extracted data is respectively applied to the merged data frame.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A final tidy data set is created with the extracted, merged, and manipulated data in a file called *TidyDataSet.txt*.

## Conclusion
The final tidy data set for the data can be found in the file within the repository labeled: *TidyDataSet.txt*

*Subject ID* - First Column

*Activity Labels* - Second Column

*Calculated Values* - Remaining Columns
