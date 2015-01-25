##########################################################################################################

# Coursera Getting and Cleaning Data Course Project

# run_analysis.r File Description:

# This script is designed to work on the following dataset:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# which can be downloaded here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The script accomplishes the following tasks to the dataset: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##########################################################################################################

# this will be used in the last step
library(plyr)

# adjust this as needed
setwd("C:/Users/Admin/Documents/Coursera Classes/getting and cleaning data/project/UCI HAR Dataset")

# Load Datasets
dataActivityTest  <- read.table("test/y_test.txt",header = FALSE)
dataActivityTrain <- read.table("train/y_train.txt",header = FALSE)

dataFeaturesTest  <- read.table("test/X_test.txt", header=FALSE)
dataFeaturesTrain <- read.table("train/X_train.txt", header=FALSE)

dataSubjectTest   <- read.table("test/subject_test.txt")
dataSubjectTrain  <- read.table("train/subject_train.txt")


# start combining sets, and naming the variables
## x <- rbind(x_train, x_test)
activityData        <- rbind(dataActivityTest, dataActivityTrain)
names(activityData) <- c("activity")
subjectData         <- rbind(dataSubjectTest, dataSubjectTrain)
names(subjectData)  <- c("subject")

# features data uses 2nd column of features.txt to name
featuresData        <- rbind(dataFeaturesTest, dataFeaturesTrain)
featuresNames       <- read.table("features.txt", head=FALSE)
names(featuresData) <- featuresNames$V2

# combine all data into one dataset(df)
subjectActivityCombined <- cbind(subjectData, activityData)
mergedData              <- cbind(featuresData, subjectActivityCombined)

# Collect the variable names that include mean and sd by grep(mean and std, ignoring case)
colsToKeep <- grep(".*mean.*|.*std.*", featuresNames$V2, ignore.case=TRUE)

# add our subject and activity columns back into colsToKeep
colsToKeep <- c(colsToKeep, 562,563)

# subset mergedData to be only the columns we need
mergedData <- mergedData[,colsToKeep]

# loads the activity labels data
activityLabels <- read.table("activity_labels.txt", header = FALSE)

# replace ints in mergedData$activity with corresponding factors from activity labels
iLabel <- 1
for (i in activityLabels$V2){
        mergedData$activity <- gsub(iLabel, i, mergedData$activity) 
        iLabel <- iLabel + 1
}

# recreate subject and activity as factors
mergedData$activity <- as.factor(mergedData$activity)
mergedData$subject  <- as.factor(mergedData$subject)

# 4. Appropriately labels the data set with descriptive variable names. 
names(mergedData) <- gsub("^t", "time", names(mergedData))
names(mergedData) <- gsub("^f", "frequency", names(mergedData))
names(mergedData) <- gsub("Mag", "Magnitude", names(mergedData))
names(mergedData) <- gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData) <- gsub("Gyro", "Gyroscope", names(mergedData))

# aggregate data of all variables by activity and subject, and take the mean
tidyMergedData <- aggregate(. ~ subject + activity, mergedData, mean)
# Order the dataset by subject, then by activity
tidyMergedData <- tidyMergedData[order(tidyMergedData$subject,tidyMergedData$activity),]
# write the final table to file
write.table(tidyMergedData, "tidy.txt", sep="\t", row.name=FALSE)




