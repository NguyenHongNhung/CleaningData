##### Open the file (after downloading and unzipping)
setwd("E://STUDY//R//Coursera - Data Cleaning//Assignment//Final Assignment//UCI HAR Dataset//test")

test_measurement <- read.table("X_test.txt")
test_activity <- read.table("Y_test.txt")
test_subject <- read.table("subject_test.txt")

setwd("E://STUDY//R//Coursera - Data Cleaning//Assignment//Final Assignment//UCI HAR Dataset//train")

train_measurement <- read.table("X_train.txt")
train_activity <- read.table("Y_train.txt")
train_subject <- read.table("subject_train.txt")

##### Merges the training and the test sets to create one data set.


test <- cbind(test_subject, test_activity, test_measurement)
train <- cbind(train_subject, train_activity, train_measurement)

alldat <- rbind(test, train)

##### Appropriately labels the data set with descriptive variable names.

## Put colunm names:
setwd("E:/STUDY/R/Coursera - Data Cleaning/Assignment/Final Assignment/UCI HAR Dataset")
feature <- read.table("features.txt")
feature[,2] <- as.character(feature[,2])

colnames(alldat) <- c("subject", "activity", feature[,2])

##### Extracts only the measurements on the mean and standard deviation for each measurement.

vars_std <- c("subject", "activity", grep(".*std.*", colnames(alldat), value = T))
alldat2 <- alldat [, vars_std]

vars_mean <- c(grep(".*mean.*", colnames(alldat), value = T))
alldat3 <- alldat [, vars_mean]

## Drop all variable named meanFreq
alldat3 <- alldat3[,-grep(".*meanFreq.*",colnames(alldat3))]

## Then, combine all measurements on mean and standard deviation:
newdat <- cbind(alldat2, alldat3)

##### Uses descriptive activity names to name the activities in the data set
setwd("E:/STUDY/R/Coursera - Data Cleaning/Assignment/Final Assignment/UCI HAR Dataset")
name_act <- read.table("activity_labels.txt")
name_act[,2] <- as.character(name_act[,2])

for (i in 1:6)  {  
  newdat$activity[newdat$activity == i] <- name_act[i,2]
}  


##### From the data set in step 4, creates a second, independent tidy data set 
##### with the average of each variable for each activity and each subject.

library(data.table)

alldat_melted <- melt(newdat, id = c("subject", "activity"))
tidydat_mean <- dcast(alldat_melted, subject + activity ~ variable, mean)

write.table(tidydat_mean, "tidy.txt", row.names = FALSE, quote = FALSE)