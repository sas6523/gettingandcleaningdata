---
output: html_document
---
# Getting and Cleaning Data Class Project CodeBook
***

## Description
***
Contained herein is a description of variables, data and R code used to complete the Getting and Cleaning Data class from Coursera. 

## Source Data
***
The data used in this project can be found at the [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Data descriptions can be [found here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Dataset Information
***
From the UCI Machine Learning Repository:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:
***
For each record in the dataset it is provided: 

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.


## The Data
***
The data we used are included in the following files:

1. features.txt : Information on variable names
2. activity_labels.txt : Links the activity levels with their names
3. subject_train.txt : List of subjects and corresponding activities
4. x_train.txt : Training labels
5. y_train.txt : Training labels
6. subject_test.txt :
7. x_test.txt : Test set
8. y_test.txt : Test set

## Transformations
***
The transofrmations were done in 5 parts, as per the instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How `run_analysis.R` implements these steps:
***
* Requires `plyr` library
* Load test, and train data
* Load features and activity data
* Extract the mean and sd column data
* Process the data
* Merge the Data sets
* Write `tidy.txt` to file.

