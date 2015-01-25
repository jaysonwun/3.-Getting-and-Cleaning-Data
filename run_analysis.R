install.packages("downloader")
library(downloader)

setwd("~/Coursera/Getting and Cleaning Data/Assignment")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="UCI-HAR-dataset.zip", mode="w")
tmp <- tempfile(fileext = ".zip")
download(url, tmp)
unzip(tmp) 

# Merges the training and the test sets to create one data set.
x.train <- read.table('./UCI HAR Dataset/train/X_train.txt')
x.test <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(x.train, x.test)
##View(x)

y.train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y.test <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(y.train, y.test)
##View(y)

subj.train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subj.test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subj <- rbind(subj.train, subj.test)
##View(subj)

# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table('./UCI HAR Dataset/features.txt')
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])  ##searches features that contain "-mean()" or "-std()"
x.mean.sd <- x[, mean.sd]								  ##only takes the columns that contain "-mean()" or "-std()" in x	
names(x.mean.sd) <- features[mean.sd, 2]				  ##looks up rows from the features table with the corresponding feature
names(x.mean.sd) <- tolower(names(x.mean.sd)) 			  ##changes all the names to lowercase
names(x.mean.sd) <- gsub("\\(|\\)", "", names(x.mean.sd)) ##removes the () pattern in the names of the activities

# Uses descriptive activity names to name the activities in the data set
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')	
activities[, 2] <- tolower(as.character(activities[, 2]))			##changes activities to lowercase
activities[, 2] <- gsub("_", "", activities[, 2])  					##removes the _ in the body of the data
y[, 1] = activities[y[, 1], 2]										##looks up values from activities table and places them into y
activityname <- y

# Appropriately labels the data set with descriptive activity names.
colnames(subj) <- 'subject number'
colnames(activityname) <- 'activityname'
data <- cbind(subj, activityname, x.mean.sd)
#str(data)
write.table(data, 'merged.txt')

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
average <- aggregate(x=data, by=list(activities=data$activityname, subj=data$subj), FUN=mean)
average<-average[c(-3,-4)]
#str(average)
write.table(average, 'average.txt')