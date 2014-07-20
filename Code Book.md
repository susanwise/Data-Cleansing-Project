Code Book for tidy_data
=======================
**Overview of Data used to create Tidy_Data**
The source of the data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .  

The main directory for the data is "UCI HAR Dataset".  At the main directory level, the following 2 files were read:
1 - activity_labels.txt  THis file contains the Activity Names associated with the codes 1-6.
2 - features.txt  This file contains the column names for the 561 columns contained in the data files.

There are 2 folders under the main directory.  One folder for "test" observations and a second folder for "train" observations.  Each of these folders contains 3 files that were used to create the Tidy_Data.

**Test Files**
1 - X_test.txt - this contains the observations
2 - subject_test.txt - this contains the participant associated with each row of observations
3 - y_test.txt - this contains the activity code associated with each row of observations

**Train Files**
1- X_train.txt - this contains the observations
2 - subject_train.txt - this contains the participant associated with each row of observations
3 - y_train.txt - this contains the activity code associated with each row of observations

**Steps to create Tidy Data **
The following steps were used to create the Tidy Data from these 8 text file.
(your working directory must be set to the folder that contains the UCI HAR Dataset directory for the run_analysis function to execute and provide the tidy_data.

1. read features.txt
2. read acivity_labels.txt
3. supply column names to the activity_labels data
4. set directory to the test directory and read the three test files
5. supply the column names to the X_test observations using the data supplied in the features.txt file.   Supply column names to the Subject_test and y_test data.
6. subset the X_test data to only include the mean() and std() features.
7. Combine the X_test, y_test and subject_test data using cbind.
8.  set the directory to the train direcotry and read the three train files.
9.  repeat the steps taken for the test data using the train data(steps 5-7)
10. combine the test and train data using rbind.
11. add a column to contain a activity name.
12  convert the data frame to a data table and aggregate the data into one row per participant and activity calculating the average for each feature.
13. sort the aggregated data to create  tidy_data 

**Overview of Data in Tidy_Data** 
The "tidy_data" set has 180 rows of data.  There were 30 participants in this study that were each measured for 6 distint activities. Averages for each measured feature value are presented for every participant for each activity (6 rows of data for each participant).  The columns contained in the "tidy_data" are documented below.  There was a total of 10299 data rows that were grouped by Participant and Activity with the Average calculated for columns 4-69 which are described in detail below.

**Column 1 - Participant**
Integer  - from 1-30 representing the participant number

**Column 2 - Activity**
Integer - code from 1-6 representing the activity that was measured

**Column 3 - Activity Name** 
Factor - the name that corresponds to each activity 
1 - WALKING
2 - WALKING_UPSTAIRS
3 - WALKING_DOWNSTAIRS
4 - SITTING
5 - STANDING
6 - LAYING  

**Columns 4 - 69**
Number - there are 2 columns for each feature described below - one column that is the Average Mean and a second column that is the Average Standard Deviation.  The features are descibed in detail below.

**Feature Selection **
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
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

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

There are 33 feature variables for mean() and 33 feature variables for std()

Complete list of column names for Columns 4-69:
  tBodyAcc-mean()-X         
  tBodyAcc-mean()-Y          
  tBodyAcc-mean()-Z          
  tBodyAcc-std()-X           
  tBodyAcc-std()-Y           
  tBodyAcc-std()-Z           
  tGravityAcc-mean()-X       
  tGravityAcc-mean()-Y       
  tGravityAcc-mean()-Z      
  tGravityAcc-std()-X        
  tGravityAcc-std()-Y        
  tGravityAcc-std()-Z        
  tBodyAccJerk-mean()-X      
  tBodyAccJerk-mean()-Y      
  tBodyAccJerk-mean()-Z      
  tBodyAccJerk-std()-X       
  tBodyAccJerk-std()-Y       
  tBodyAccJerk-std()-Z       
  tBodyGyro-mean()-X         
  tBodyGyro-mean()-Y         
  tBodyGyro-mean()-Z         
  tBodyGyro-std()-X          
  tBodyGyro-std()-Y          
  tBodyGyro-std()-Z          
  tBodyGyroJerk-mean()-X     
  tBodyGyroJerk-mean()-Y     
  tBodyGyroJerk-mean()-Z     
  tBodyGyroJerk-std()-X      
  tBodyGyroJerk-std()-Y      
  tBodyGyroJerk-std()-Z      
  tBodyAccMag-mean()         
  tBodyAccMag-std()          
  tGravityAccMag-mean()      
  tGravityAccMag-std()       
  tBodyAccJerkMag-mean()     
  tBodyAccJerkMag-std()      
  tBodyGyroMag-mean()        
  tBodyGyroMag-std()         
  tBodyGyroJerkMag-mean()    
  tBodyGyroJerkMag-std()     
  fBodyAcc-mean()-X          
  fBodyAcc-mean()-Y          
  fBodyAcc-mean()-Z          
  fBodyAcc-std()-X           
  fBodyAcc-std()-Y           
  fBodyAcc-std()-Z           
  fBodyAccJerk-mean()-X      
  fBodyAccJerk-mean()-Y      
  fBodyAccJerk-mean()-Z      
  fBodyAccJerk-std()-X       
  fBodyAccJerk-std()-Y       
  fBodyAccJerk-std()-Z       
  fBodyGyro-mean()-X         
  fBodyGyro-mean()-Y         
  fBodyGyro-mean()-Z         
  fBodyGyro-std()-X          
  fBodyGyro-std()-Y          
  fBodyGyro-std()-Z          
  fBodyAccMag-mean()         
  fBodyAccMag-std()          
  fBodyBodyAccJerkMag-mean() 
  fBodyBodyAccJerkMag-std()  
  fBodyBodyGyroMag-mean()    
  fBodyBodyGyroMag-std()     
  fBodyBodyGyroJerkMag-mean()
  fBodyBodyGyroJerkMag-std()Enter file contents here
