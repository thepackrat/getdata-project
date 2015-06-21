#
# Script to perform a data analysis on the user activity data set.
#
# Usage:
# source("run_analysis.R")
#

require(dplyr)

# this is the vector of column names for the large data sets.
column_labels <- read.table("features.txt", sep=" ",
    colClasses=c("NULL", "character"))[[1]]

activity_levels <- read.table("activity_labels.txt", sep=" ",
    colClasses=c("character", "character"))

# Remove () and translate - -> _ in variable names so we can use $
column_labels <- gsub("()", "", column_labels, fixed=TRUE)
column_labels <- gsub("-", "_", column_labels, fixed=TRUE)
# these columns have duplicate names (and we don't want them anyway)
# so we create an vector of all the non-duplicate-named ones to cut
# out of the tables later.
keep_columns = grep("bandsEnergy", column_labels, invert=TRUE)

# these take a long time, so we'll reuse them from the workspace if
# the following two lines are commented.
test_raw <- read.fwf("test/X_test.txt", widths=rep(16,561))
train_raw <- read.fwf("train/X_train.txt", widths=rep(16,561))

# read in the activity and subject columns that we'll need to include later.
test_activity <- read.csv("test/y_test.txt", header=FALSE,
                         colClasses=c("factor"))
test_subject <- read.csv("test/subject_test.txt", header=FALSE)

train_activity <- read.csv("train/y_train.txt",
                           header=FALSE,
                           colClasses=c("factor"))
train_subject <- read.csv("train/subject_train.txt",
                          header=FALSE)


test_table <- test_raw
train_table <- train_raw
colnames(test_table) <- column_labels
colnames(train_table) <- column_labels

# remove the columns that have duplicate names.
test_table <- test_table[,keep_columns]
train_table <- train_table[,keep_columns]

# add the separate subject and activity columns back in to test and train
# tables
test_table$subject <- test_subject[[1]]
test_table$activity <- test_activity[[1]]
train_table$subject <- train_subject[[1]]
train_table$activity <- train_activity[[1]]

# merge into one megatable.

fulldata <- tbl_df(merge(test_table, train_table, all.x=TRUE, all.y=TRUE)) %>%
    select(matches("_mean|_std|^subject$|^activity$"))

# replace activity factor integers with our nice names.
levels(fulldata$activity) <- activity_levels[[2]]

# This is our summary with a mean over each variable from fulldata, groups by
# subject and activity.
summarydata <- summarise_each(group_by(fulldata, subject, activity),
    funs(mean))





