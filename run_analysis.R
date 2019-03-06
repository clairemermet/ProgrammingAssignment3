# From the data test and train available here : 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

cleanData <- function(workingDirectory) {
        
        # Set the working directory passed in parameter
        # In my case : 
        # "C:/PROJECTS/Data Science - Coursera/R working directory/Cours 3 - Getting and Cleaning Data/Evaluation/Projet"
        setwd(workingDirectory)
        
        # Charge the library dplyr
        library(dplyr)
        
        # Read the header file features.txt
        headers <- read.csv("./UCI HAR Dataset/features.txt",sep=" ",header=FALSE,col.names=c("id","feature"))
        # Read the test file X_test.txt and add the good headers
        test <- read.csv("./UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE,col.names=headers$feature)
        # Read the train file X_test.txt and add the good headers
        train <- read.csv("./UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE,col.names=headers$feature)
        
        # Keep only mean and std columns from test data
        meanColTest <- test[,grepl("mean()",names(test))]
        stdColTest <- test[,grepl("std()",names(test))]
        test <- cbind(meanColTest,stdColTest)
        
        # Keep only mean and std columns from train data
        meanColTrain <- train[,grepl("mean()",names(train))]
        stdColTrain <- train[,grepl("std()",names(train))]
        train <- cbind(meanColTrain,stdColTrain)
        rm(meanColTrain)
        rm(stdColTrain)
        
        # Read the label activity
        label_values <- read.csv("./UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE,col.names=c("labelid","label"))
        
        # Add the activity label and the subject to the test data
        label_test <- read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names=c("labelid"))
        label_test <- merge(label_test,label_values,by.x="labelid",by.y="labelid")
        subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names=c("subject"))
        test <- cbind(label_test,subject_test,test)
        
        # Add the activity label and the subject to the train data
        label_train <- read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names=c("labelid"))
        label_train<- merge(label_train,label_values,by.x="labelid",by.y="labelid")
        subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names=c("subject"))
        train <- cbind(label_train,subject_train,train)

        # Merge test and train data by rows
        mergeData <- rbind(test,train)
        
        # Create a dataset with the average of each variable for each activity and each subject
        arrange <- aggregate(mergeData[, 4:82], list(mergeData$label,mergeData$subject), mean)
        arrange <- arrange(arrange,Group.1,Group.2)
        arrange <- rename(arrange,activity=Group.1)
        arrange <- rename(arrange,subject=Group.2)
        
        # Write the result in a txt file
        write.table(arrange,file = "result.txt",row.name=FALSE)
        
        # Return value
        arrange
}





