# getdata-project
Project files for the Getting and Cleaning data course


## Running the Analysis

Usage:
  source("run_analysis.R")
This script expects to be run with a working directory containing
the data set from the Getting and Cleaning Data course that is available
from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It creates two tidy data sets:
* fulldata  a tidy data set merging and cleaning up the initial data
* summarydata  a tidy set summarasing all variables in the first data set broken out by user and activity.

## What the analysis script does.

For ease of debugging, the script leaves intermediate data points in your
workspace. These are the date cleanup steps the script performs:

* Reads in all the base data from test and training sets
* adds the column names from "features.txt"
* fixed the column names to work with $ by removing () and mapping - to _
* Adds subject and activity columns that are in separate files for each set
* removes columns with duplicate names
* Merges test and training sets together
* replaced integer activity levels with names from activity_levels.txt

for the summary data set, we group the data table by activity and subject 
and then calculate the means for each variable within each group.
