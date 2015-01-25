Getting and Cleaning Data Peer Assessment
----------

The exercise's description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Objectives
-----------------

`run_analysis.R` performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------
1. The script downloads the UCI HAR Dataset and unzips the file into the UCI HAR Dataset folder.
2. It loads the train and test data sets and extracts only the mean and standard deviations from the data set. This is done by looking up these values from the features dataset using the grep command.
3. The columns are cleaned and then added to the original x data frame. 
4. The activity and subjects are then added into the data set.
5. Subject, activity, and x are then merged into one single data set and exports the text file called merged.txt data with this cleaned dataset.
6. The mean of the activities and subjects are then calculated and grouped by activity and subject. This new .txt file is exported as average.txt.




