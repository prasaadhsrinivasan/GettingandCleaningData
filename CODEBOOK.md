**"Getting and Cleaning Data"** Course Project Code Book
========================================

## Data for cleaning
The data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
This dataset provide the following variables for each activity:
  1. *subject* - ID of participant
  2. *activity* - ID of activity type


## CodeBook

The following data transformations were conducted to form a tidy dataset:  

1. Added a new feature ***activitylabel*** - factor variable for activities with the following levels: *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*. 

2. Tidy dataset was build as a mean values of features grouped by ***activitylabel*** and ***subject*** - for each subject and activity type determined mean values over all activities of that type.  