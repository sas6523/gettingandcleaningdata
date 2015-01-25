# Getting and Cleaning Data Class Project
***
This is the repository of the course project for the Coursera Getting and Cleaning Data course. 

## Overview
This project aims to teach the collection and tidying of data pre-analysis.
The data sets used for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A description from the authors of the data set can be located [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Before running this script
After obtaining the datasets from the above links, you will have to set your working directory as appropriate by modifying line 25 of `run_analysis.R`:

```{r eval=FALSE}
# adjust this as needed
setwd("C:/Users/Admin/Documents/Coursera Classes/getting and cleaning data/project/UCI HAR Dataset")
```

## Project Instructions
The project instructions were given as follows:

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Further Information
For futher information, please see CodeBook.md in the same repository. 