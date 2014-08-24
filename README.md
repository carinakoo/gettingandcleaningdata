Getting and Cleaning Data Course Project
========================================

This R script reads in and summarizes data from the dataset: Human Activity Recognition Using Smartphones Data Set.  

The dataset is available at the following locations:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script first merges data from multiple files in the original dataset, including feature vectors, activity labels, and subject identifiers from the separated training and test sets.  These data are combined into a single data structure for processing.

Next, the feature/variable names and the activity names are relabeled. The variable names used are consistent with the feature names specified in the original dataset file: "features.txt". These variable names were chosen with consideration for descriptiveness, consistency, and clarity with the original dataset codebook. The activity labels are replaced by descriptive activity names according to the original dataset codebook file "activity\_labels.txt".

The data are then subsetted to include only the measurements on the mean and standard deviation for each measurement. Concretely, this includes only the measurements whose feature names included "mean()" or "std()", and specifically does not include some measurements in the original dataset which included other types of means measurements.

Finally, the data is recast to provide the mean for each subject, activity, and measurement variable. Each row in the table provides, for each unique combination of subject and activity: subject identifier, activity label, and calculated means across all records of each of the 66 "mean()" and "std()" variables. 
