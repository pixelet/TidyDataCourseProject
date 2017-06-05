# run_analysis.R

# Setting current working directory
setwd("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project")

library(data.table)
library(dplyr)

# Reading training tables:

x_train <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('C:/Users/I231112/Downloads/R_Class/3_data-cleaning/week_4/Project/UCI HAR Dataset/activity_labels.txt')


# Assimilating Columns 
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Combining two data sets in one
comb_train <- cbind(y_train, subject_train, x_train)
comb_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(comb_train, comb_test)

# Merging all in one data set
colNames <- colnames(setAllInOne)


# Only selecting columns with "mean" and "Std" values
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)


set_MeanAndStd <- setAllInOne[ , mean_and_std == TRUE]


set_ActivityNames <- merge(set_MeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# Calculate Averge of the final result set

secTidySet <- aggregate(. ~subjectId + activityId, set_ActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# writing to a filename
write.table(secTidySet, "TidySet2.txt", row.name=FALSE)
