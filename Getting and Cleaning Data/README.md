##Getting-and-Cleaning-Data-Assignment

Run_Analysis.R R-script on Human Activity Recognition Using Smartphones Dataset

This script processes data from the Human Activity Recognition Using Smartphones Dataset to extract the average means and standard deviations of each variable for a given subject and activity, returning a tidy data frame containing these values.

The script imports the test and training datasets from the UCI HAR data and combines them into a single dataframe, with the columns named from the features.txt file provided in the archive.

Partial string matching using grep is used to identify the columns that include mean() and std() in their name. These columns of interest are then assigned to a new data frame.

Using the "merge" function, descriptive activity names and subject are merged with the mean/std values dataset, to get one dataset with descriptive activity names

With the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included featuresand the data is written to the "Average_tidy_data.txt" file.

