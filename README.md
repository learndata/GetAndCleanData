# Coursera Getting and Cleaning Data Course Final Project

## Overview
This project provides the code to read in Smartphone biometric data and process it as required in the course final projeect instructions.   The documentation describing the data collection can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The required data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Required R Libraries
* plyr
* dplyr
* reshape2

## Processing
* Download and expand the data zip file
* Set the R working directory to the "UCI HAR Dataset" directory created by the zip file.
* run project_script.R

## Results
* The resulting file will be place in the "UCI HAR Dataset" directory and will be named "ProjectSubmission.txt".   It is a .csv file with the data presented in long format.

## Sample output format

"Subject","Activity","variable","average"
1,"LAYING","tBodyAcc-mean()-X",0.22159824394
1,"LAYING","tBodyAcc-mean()-Y",-0.0405139534294
1,"LAYING","tBodyAcc-mean()-Z",-0.11320355358
...

Download the project_script.R script from github and run it.
