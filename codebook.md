# Codebook changes

This document describes the data sources and types presents in the two
tidy data sets, mostly with reference to the original codebook
available with the data set from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## fulldata

This data set combines all measurements from the test and training
data sets of the original data sets into a single unified set.

### Variables
There are two new variables:
* subject: this represents the matching subject index value obtained
from "subject_test.txt" or "subject_train.txt"
* activity: This is a named factor variable containing a string
  representation of the activity undertaken (based on "activity_labels.txt")

The remainder of the variables are named as the original
data with all instances of "()" removed and hyphens "-" converted to
underscores "_"


## summarydata

The units and variable names for each of the variables are identical
for the summarydata table as for the fulldata table above, except that
each value represents an average of the mean or std variable for each
of the activities of a given type undertaken by a single subject.
