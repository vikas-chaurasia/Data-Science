#CodeBook

This code book includes information about the source data, the transformations performed after collecting the data and some information about the variables of the resulting data sets.

#Study Design

The source data was collected from the UCI Machine Learning Repository to complete an assignment for a Coursera course named Getting and Cleaning Data instructed by Jeff Leek. The assignment involved working with the data set and producing tidy data representation of the source data. Below is a list of the operations done to achieve the outputs.

Data Available Here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1)Downloaded the data set
2)Unzipped the data set into  working directory
3)Loaded test and training data sets into data frames
4)Loaded activity labels
5)Combined test and training data frames using rbind
6)Paired down the data frames to only include the mean and standard deviation variables7)Combined the data frames to produce one data frame containing the subjects, measurements and activities
8)Produced "tidy_data.txt" with the combined data frame as the first expected output
9)Created another data set using the reshape2 library function melt to easily group the tidy data by subject and activity and Then applied the mean calculations by dcast function  across the groups
10)Produced "Average_tidy_data.txt" as the second expected output
11)Please refer to run_analysis.R for implementation details.

#Variables

subjectId: 1 to 30 each representing a participant in the study
activity: the activity that the subject was doing at the time of the measurement WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Feature:Data collected from the accelerometers from the Samsung Galaxy S smartphone

