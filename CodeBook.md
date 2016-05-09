## Code Book Markdown File
Describes script located in run_analytics.R which is used to transform datatables

Variables:  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
mean(): Mean value  
std(): Standard deviation  

File Descriptions:  
The data is provided by UCI (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and contains:  
test/subject_test.txt  
train/subject_train.txt  
Activity Data  
test/X_test.txt  
train/X_train.txt  
Data  
test/y_test.txt  
train/y_train.txt  
features.txt  
activity_labels.txt  
  

Code Description:
Downloads Data
Reads files and creates folders
Marges the train set and data set to create one data
Extracts only measurements for mean and std
Names and labels activites in the dataset
Creates a dataset2 with new requirements which been outlined in readme
