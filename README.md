# TidyDataProject
Coursera: Getting and Cleaning Data

This script creates a tidy analysis dataset from the 'UCI HAR dataset'. The UCI dataset contains summary statistics of data collected from smartphone accelerometers and gyrometers. Thirty subjects performed six different activities with smartphones attached.


I grouped my code into the following steps:


set working directory, download and unzip files

load activity labels, features, labels, subjects, and data

bind labels and subjects to data, create master table

extract subject, label, and mean/std variables

group by subject and and activity to create summary data set

write txt file
