run_analysis<-function(){

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Dataset <- "Dataset.zip"
download.file(url,file.path(getwd(),Dataset))
unzip("./dataset.zip")

##Load test data

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
Y_test = read.table("UCI HAR Dataset/test/Y_test.txt")

##Load training data

subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
X_train = read.table("UCI HAR Dataset/train/X_train.txt")
Y_train = read.table("UCI HAR Dataset/train/Y_train.txt")


##Load activity and feature information
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))


##Task 1) Merge the training and the test sets to create one data set

X_full<-rbind(X_test, X_train)
Y_full<-rbind(Y_test, Y_train)
subject_full<-rbind(subject_test, subject_train)

##name the X_full dataset
colnames(X_full)<-features[,2]

## Task 2) Extract only the measurements on the mean and standard deviation for each measurement
###fetch column index from dataset which contains mean and standard deviation  using grepl 
colindex<-grepl("mean()",colnames(X_full)) | grepl("std()",colnames(X_full))

##filter X_FULL dataset with only mean and standard deviation measurements
X_mean_std <- X_full[,colindex]

## Task 3) Uses descriptive activity names to name the activities in the data set
## Task 4)Appropriately labels the data set with descriptive variable names. 

names(Y_full) = "activityId"
names(subject_full)="subjectId"

## merge data frames of subject , y and mean/std .
all_data <- cbind(subject_full,Y_full, X_mean_std)
##Merge the activities dataset with the all dataset 
##to get one dataset with descriptive activity names
full_data<-merge(activities,all_data,by.x="activityId",by.y="activityId",all=TRUE)
write.table(full_data, "tidy_data.txt")

##task5  creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
data_melt <- melt(full_data,id=c("activityId","activityLabel","subjectId"))
mean_data <- dcast(data_melt,activityId + activityLabel + subjectId ~ variable,mean)

## Create a file with the new tidy dataset
write.table(mean_data,"./Average_tidy_data.txt")


}