Welcome to my submission for the Coursera Getting and Cleaning Data final assignment ! 

This repository contains:
1) README.md (current file)
2) CodeBook.md
3) run_analysis.R

run_analysis.R is a commented script that, when executed, will:
1) If necessary, install the dplyr package that will be used for tidying the data.
2) If necessary, download and unzip the UCI HAR Dataset
3) Load all the required data sets from training and testing
4) Compile the training and testing data into one tidy data set. The mean() and std() measurements of each variable are kept (66 total variables)
5) Add to the dataset the subject IDs and activity labels (total is 68 variables).
6) The activities labels are used instead of their corresponding integers. 
7) Renames the variables using their feature names taken from feature.txt in the UCI HAR Dataset.
8) Creates an independent tidy data set containing the mean of all measurements per activity and subject. 

A detail of the transformation and variables, their units and additional information is available in CodeBook.md
