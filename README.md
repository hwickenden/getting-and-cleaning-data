# getting-and-cleaning-data repository
This repository contains the files created as part of the course project for Coursera 'Getting and Cleaning Data' course. It involves transforming and analysing activity gyroscope data.

# The Data
The files contained in this repository are built around data collected from accelerometers of the Samsung Galaxy S smartphone. The data were collected as part of an experiment to record gyroscope signals from different types of activities.

A full description of the experiment is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Note that analysis scripts in this repository assume the data has been locally downloaded.

# run_analysis.R
This script has been created to tidy and analyse the data which is downloadable from the above link.

The purpose of this script is to merge the training and the test sets to create one data set, extract only the measurements on the mean and standard deviation for each measurement, recode variables and results to be more transparent and then creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Specifically the steps of the script run as follows:
* 0: Set working directory as 'UCI HAR Dataset' folder.
* 1: Load required packages.
* 2: Load required data sets.
* 3: Rename x_test and y_test varaibles with the names given in 'features.txt'.
* 4: Merge y_test and y_train to x_test and x_train respectively.
* 5: Merge subject_test and subject_train to x_test and x_train respectively.
* 6: Merge test and training sets.
* 7: Extract mean and standard deviation measurements, plus the subject and activity IDs.
* 8: Replace activity IDs with descriptive activity names, taken from 'activity_labels.txt'.
* 9: Make variable names more descriptive.
* 10: Create independent tidy data set with the average of each variable for each activity and subject.

# CodeBook.md
The code book explains the data sets used and their variables. It also explains the resulting data set and how it relates to the original ones.
