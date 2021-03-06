# Code Book

Coursera Getting and Cleaning Data Course
Final Project
Description of code found in run_analysis.R

* Assumptions
* Required Libraries
* Variables
* Processing algorithm

## Assumptions
* Zip file has been downloaded and is locally available
* Working directory has been set to "UCI HAR Dataset" parent directory

## Required Libraries
* plyr
* dplyr
* reshape2

## Variables
* activities dataframe - downloaded list of activities metadata
* features dataframe - downloaded list of feature metatata
* ndata dataframe - tidy data set containing combined test and train datasets with clean column titles.   All non mean and std measurement columns have been removed.
* mdata dataframe - transformation of ndata dataframe that uses melt to dervie long form of data 
* tdata dataframe - transformation of ndata dataframe that combines and averages the activity variable measurements by subject, activity, variable.

## Processing algorithm

* Process metadata files
  * load features list into features dataframe
  * load activities into activities dataframe
* Process training data set
  * load training data set into train dataframe
  * Add features labels to train dataframe
  * read training activities and add them to the train dataframe
  * read subjects and add them to the train dataframe
* Process test data set
  * load test data set into test dataframe
  * Add features labels to test dataframe
  * read test activities and add them to the test dataframe
  * read subjects and add them to the test dataframe
* Combine test and train datasets into single dataset with correct labels
  * Combine test and train dataframes into single ndata dataframe
  * remove measurement columns that are not mean or standard deviation
  * Add descriptive activity names from activity dataframe 
* Create processed data set with average of all sum and mean measurements by person/activity 
  * Transform ndata dataframe using melt into long version called mdata where all variable columns are transformed into individual rows consisting of "variable / value" pairs
  * Derive the final tidy dataset consisting of subject, activity, variable, mean(value) rows. 
* Create the final output file for submission
  * write the results to a comma separated .txt file in the parent directory.  The file will be named  ProjectSubmission.txt
