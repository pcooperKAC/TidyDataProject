require(dplyr)

#### set working directory, download and unzip files ####
setwd("C:/Users/PCooper/Desktop/Coursera R Programming/Getting and Cleaning Data")
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "course_project_data.zip"
download.file(zip_url, zip_file)
unzip(zip_file)

#### load activity labels, features, labels, subjects, and data ####
setwd("UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityID", "Activity"))
features <- read.table("features.txt")
train_data <- read.table("train/X_train.txt", col.names = features$V2)
train_subjects <- read.table("train/subject_train.txt", col.names = "Subject")
train_labels <- read.table("train/y_train.txt", col.names = "ActivityID")
test_data <- read.table("test/X_test.txt", col.names = features$V2)
test_subjects <- read.table("test/subject_test.txt", col.names = "Subject")
test_labels <- read.table("test/y_test.txt", col.names = "ActivityID")

#### bind labels and subjects to data, create master table ####
train <- cbind(train_subjects, train_labels, train_data)
test <- cbind(test_subjects, test_labels, test_data)
master <- merge(rbind(train, test), activity_labels)

#### extract subject, label, and mean/std variables ####
extract <- master[c(2, 564, c(grep("mean()", features$V2), grep("std()", features$V2))+2)]

#### group by subject and activity to create summary data set ####
summary <- data.frame(summarise_each(group_by(extract, Activity, Subject), funs(mean)))

#### write txt file ####
write.table(summary, "../tidydata.txt", row.names = FALSE)