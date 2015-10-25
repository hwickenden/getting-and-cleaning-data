# run_analysis.R is the script required as part of the Course Project for the Coursera course 'Getting and Cleaning Data'.

# Please consult README.md and CodeBook.md for further information.

# 0. Set working directory as "UCI HAR Dataset" folder:
setwd("./UCI HAR Dataset")

# 1. Load required packages:

# First check required packages are installed. If any required packages are not installed, install them.
list.of.packages <- c("plyr", "dplyr", "reshape2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages, dependencies = TRUE)}

# Load packages into environment.
library(plyr)
library(dplyr)
library(reshape2)

# 2. Load required data sets:

# Load test data
subject_test <- read.table("test/subject_test.txt", head = FALSE)
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# Load Training Data
subject_train <- read.table("train/subject_train.txt", head = FALSE)
x_train <- read.table("train/x_train.txt")
y_train <- read.table("train/y_train.txt")

# Load variable Names for X test/training sets
features <- read.table("features.txt")

# 3. Rename x_test & x_train variables with the names given in 'features.txt':
names(x_test) <- features$V2
names(x_train) <- features$V2
rm(features) # tidy up global environment

# 4. Merge y_test & y_train (i.e. activity IDs) to x_test & x_train respectively
x_test$activity_ID <- y_test$V1
x_train$activity_ID <- y_train$V1
rm(y_test, y_train) # tidy up global environment

# 5. Merge subject_test & subject_train (i.e. subject IDs) to x_test & x_train respectively
x_test$subject_ID <- subject_test$V1
x_train$subject_ID <- subject_train$V1
rm(subject_train, subject_test) # tidy up global environment

# 6. Merge test and training sets:
merged_data <- rbind(x_test, x_train)
rm(x_test, x_train) # tidy up global environment

# 7. Extract Mean and Std Dev measurements, plus the subject and activity IDs.
extract_data <- merged_data[,c(grep(c("mean|std"), names(merged_data)), 562, 563)]

# 8. Replace activity IDs with descriptive activity names (taken from 'activity_labels.txt')
extract_data$activity_ID <- gsub(1, "WALKING", extract_data$activity_ID)
extract_data$activity_ID <- gsub(2, "WALKING_UPSTAIRS", extract_data$activity_ID)
extract_data$activity_ID <- gsub(3, "WALKING_DOWNSTAIRS", extract_data$activity_ID)
extract_data$activity_ID <- gsub(4, "SITTING", extract_data$activity_ID)
extract_data$activity_ID <- gsub(5, "STANDING", extract_data$activity_ID)
extract_data$activity_ID <- gsub(6, "LAYING", extract_data$activity_ID)

# 9. Make variable names more descriptive
names(extract_data) <- gsub("-", "_", names(extract_data)) # It is not good practice to include "-" signs within variable names as "-" is a base function.
names(extract_data) <- gsub("Acc", "Accelerator", names(extract_data))
names(extract_data) <- gsub("Gyro", "Gyroscope", names(extract_data))
names(extract_data) <- gsub("Mag", "Magnitude", names(extract_data))
names(extract_data) <- gsub("^t", "time_", names(extract_data))
names(extract_data) <- gsub("^f", "frequency_", names(extract_data))

# 10. Create independent tidy data set with the average of each variable for each activity and each subject.
extract_data_melt <- melt(extract_data, id = c("subject_ID", "activity_ID"))
extract_data_mean_cast <- dcast(extract_data_melt, activity_ID + subject_ID ~ variable, mean)
tidy_data <- extract_data_mean_cast[order(as.character(extract_data_mean_cast$activity_ID), as.numeric(extract_data_mean_cast$subject_ID)),] # order rows by activity_ID and subject_ID factor levels, remove duplicate rows.

write.table(tidy_data, file="tidy_data.txt", row.names = FALSE) # write table for submission
