Human Activity Recognition Using Smartphones Dataset
 Following text files are being used to capture each movements from test and training data sets

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Variables assigned in the script
--------------------------------
x_train --> Reads training tables in x-dim
y_train --> Reads training tables in y-dim
subject_train --> Reads training subject
x_test --> Reads test tables in x-dim
y_test --> Reads test tables in y-dim
subject_test --> Reads table in test subject

colnames --> combining columns
comb_train --> combing for training data set
comb_test --> conbing the test data set
colNmaes --> gets the name for all columns Merged in one data set

setAllInOne --> puts all the column from test and train dataset in one variable

mean_and_std -- > greps for strings matching 'mean' & 'std' from the lables 

set_MeanAndStd --> sets mean value to true to pull out only the columns with mean or std in the names
set_ActivityNames --> merging of columns from both activity labels and all other colmns where "mean" and "std" are present

secTidyset -- > is 2nd set of data that is combined with all included columns and only the ones with Mean and Std values and write.table outputs to a file.
