# Getting and Cleaning Data - Coursera course 

The R script, run_analysis.R, does the following:

1. Load the activity, subject and feature info of training and test datasets
2. Merges the training and the test sets to create one data set
3. Convert colunm names of merged dataset to the name of features as in the file features.txt
4. Extracts only the measurements on the mean and standard deviation for each measurement.
  * Subset the merged data to a new data with all variables that has "mean" or "std" in their names
  * Drop all variable named meanFreq
  * Then, combine all measurements on mean and standard deviation.
5. Uses descriptive activity names to name the activities in the data set
6. Creates a tidy dataset that consists of the mean value of each variable by each subject and by activity.
  * The end result is shown in the file tidy.txt.
