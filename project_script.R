# Project Script
# Assumes all files from zip are downloaded and locally available
library(plyr)
library(dplyr)
library(reshape2)

setwd("C:/Users/Dan/Desktop/Coursera/Project/UCI HAR Dataset")

# load features.txt into features and add 
features <- read.table("features.txt")

# load activities
activities <- read.table("activity_labels.txt")

# load training data set
#setwd("C:/Users/Dan/Desktop/Coursera/Project/UCI HAR Dataset/train")
train <- read.table("train/X_train.txt")

# Add feature labels to train
colnames(train) <- features$V2

# read training activities and add them to the training table
train_labels <- read.table("train/y_train.txt")
train <- cbind(train_labels, train)
colnames(train)[1] <- "Activity" # rename default "V1" name to "Activity"

# read subjects and add them to the training table
train_subjects <- read.table("train/subject_train.txt")
train <- cbind(train_subjects, train)
colnames(train)[1] <- "Subject" # rename default "V1" name to "Activity"

# load test data set
#setwd("C:/Users/Dan/Desktop/Coursera/Project/UCI HAR Dataset/test")
test <- read.table("test/X_test.txt")

# Add feature labels to test
colnames(test) <- features$V2

# read training activities and add them to the test table
test_labels <- read.table("test/y_test.txt")
test <- cbind(test_labels, test)
colnames(test)[1] <- "Activity" # rename default "V1" name to "Activity"

# read subjects and add them to the training table
test_subjects <- read.table("test/subject_test.txt")
test <- cbind(test_subjects, test)
colnames(test)[1] <- "Subject" # rename default "V1" name to "Activity"

# combine the data
ndata <- rbind(test,train)

# clean up variables
rm(test)
rm(test_labels)
rm(test_subjects)
rm(train)
rm(train_labels)
rm(train_subjects)

# filter out columns for mean() and std()
ndata <- ndata[,grepl("Subject|Activity|mean\\(\\)|std\\(\\)", colnames(ndata))]

# Add descriptive activity names from activity DF
ndata <- merge(activities,ndata,by.x="V1", by.y="Activity")
ndata <- ndata[,2:69] #Remove unneeded activity ID column
colnames(ndata)[1] <- "Activity"

# Melt the variable columns into a long data set
mdata <- melt(ndata,id=c("Subject","Activity"),measur.vars=colnames(ndata)[3:68])

# reshape the data to group by subject, activity, and variable.   
# Average the mean and std values.  The result will be a tidy data set
# in the form subject, activity, variable, average

tdata <- ddply(mdata,c("Subject","Activity","variable"),summarize,average = mean(value))
