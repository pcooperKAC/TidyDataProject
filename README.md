# TidyDataProject
Coursera: Getting and Cleaning Data

The script "run_analysis.R" creates a tidy analysis dataset from the 'UCI HAR dataset'. The UCI dataset contains summary statistics of data collected from smartphone accelerometers and gyrometers. Thirty subjects performed six different activities with smartphones attached.

The script downloads the necessary files from the web, processes them and outputs a .txt file.
I grouped my code into the following steps:


1. set working directory, download and unzip files

2. load activity labels, features, labels, subjects, and data

3. bind labels and subjects to data, create master table

4. extract subject, label, and mean/std variables

5. group by subject and and activity to create summary data set

6. write txt file
