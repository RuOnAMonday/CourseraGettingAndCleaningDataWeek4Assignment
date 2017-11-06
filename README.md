### CourseraGettingAndCleaningDataWeek4Assignment
Week 4 assignment for coursera Getting And Cleaning Data

This project consists of:

1) The Code Book that describes all the data variables
2) The readme file with a general description (that you are reading now)
3) A file named run_analysis.R that has all the code for the assignment.
This is a set of code that loads text files and manipulates it to output a text file, which is also attached here.
In this file, we read the text files, combine data sets and rename columns and rows to make the data more descriptive. We then select a subset of columns based on means and standard deviations. Finally we calculate averages based on ActivityName and Subject (refer code book for variable descriptions).
4) A text file named tidydata.txt with the final output from the manipulation in run_analysis.R

Introduction

The goal is to prepare tidy data from data collected by the accelerometers from the Samsung Galaxy S smartphone. 

Original data source

Original data is obtained from project UCI web site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# Original data description citation: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Data preparation goals

This is the task of course project. Data preparation script should do the folowing:

1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement.
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names.
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Initial data preparation requirements

Original data should be unziped in working directory in "UCI HAR Dataset" folder. "dyplr" package should be installed.
Then run the run_analysis.R script to manipulate the data and arrive at the result in step 5.
