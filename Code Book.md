Code Book for tidy_data
=======================
**Overview of Data used to create Tidy_Data**

The source of the data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .  

The main directory for the data is "UCI HAR Dataset".  At the main directory level, the following 2 files were read:

1. activity_labels.txt  THis file contains the Activity Names associated with the codes 1-6.
2. features.txt  This file contains the column names for the 561 columns contained in the data files.

There are 2 folders under the main directory.  One folder for "test" observations and a second folder for "train" observations.  Each of these folders contains 3 files that were used to create the Tidy_Data.

**Test Files**

1. X\_test.txt - this contains the observations
2. subject_test.txt - this contains the participant associated with each row of observations
3. y\_test.txt - this contains the activity code associated with each row of observations

**Train Files**

1. X_train.txt - this contains the observations
2. subject_train.txt - this contains the participant associated with each row of observations
3. y_train.txt - this contains the activity code associated with each row of observations

**Steps to create Tidy Data**

The following steps were used to create the Tidy Data from these 8 text file.  (your working directory must be set to the folder that contains the UCI HAR Dataset directory for the run\_analysis function to execute and provide the tidy\_data.)

1. read features.txt
2. read acivity_labels.txt
3. supply column names to the activity_labels data
4. set directory to the test directory and read the three test files
5. supply the column names to the X\_test observations using the data supplied in the features.txt file.   Supply column names to the Subject\_test and y\_test data.
6. subset the X\_test data to only include the mean() and std() features.
7. Combine the X\_test, y\_test and subject\_test data using cbind.
8.  set the directory to the train direcotry and read the three train files.
9.  repeat the steps taken for the test data using the train data(steps 5-7)
10. combine the test and train data using rbind.
11. add a column to contain a activity name.
12  convert the data frame to a data table and aggregate the data into one row per participant and activity calculating the average for each feature.
13. sort the aggregated data to create  tidy_data 

**Overview of Data in Tidy_Data** 

The "tidy\_data" set has 180 rows of data.  There were 30 participants in this study that were each measured for 6 distint activities. Averages for each measured feature value are presented for every participant for each activity (6 rows of data for each participant).  The columns contained in the "tidy\_data" are documented below.  There was a total of 10299 data rows that were grouped by Participant and Activity with the Average calculated for columns 4-69 which are described in detail below.

**Column 1 - Participant**

Integer  - from 1-30 representing the participant number

**Column 2 - Activity**

Integer - code from 1-6 representing the activity that was measured

**Column 3 - ActivityName** 

Factor - the name that corresponds to each activity 
1 - WALKING
2 - WALKING_UPSTAIRS
3 - WALKING_DOWNSTAIRS
4 - SITTING
5 - STANDING
6 - LAYING  

**Columns 4 - 69**

Number - there are 2 columns for each feature described in the Feature Selection - one column that is the Average Mean and a second column that is the Average Standard Deviation.  The column names are listed below followed by a section describing the features.

Complete list of column names for Columns 4-69:

  AveragetBodyAcc-mean()-X         
  AveragetBodyAcc-mean()-Y          
  AveragetBodyAcc-mean()-Z          
  AveragetBodyAcc-std()-X           
  AveragetBodyAcc-std()-Y           
  AveragetBodyAcc-std()-Z           
  AveragetGravityAcc-mean()-X       
  AveragetGravityAcc-mean()-Y       
  AveragetGravityAcc-mean()-Z      
  AveragetGravityAcc-std()-X        
  AveragetGravityAcc-std()-Y        
  AveragetGravityAcc-std()-Z        
  AveragetBodyAccJerk-mean()-X      
  AveragetBodyAccJerk-mean()-Y      
  AveragetBodyAccJerk-mean()-Z      
  AveragetBodyAccJerk-std()-X       
  AveragetBodyAccJerk-std()-Y       
  AveragetBodyAccJerk-std()-Z       
  AveragetBodyGyro-mean()-X         
  AveragetBodyGyro-mean()-Y         
  AveragetBodyGyro-mean()-Z         
  AveragetBodyGyro-std()-X          
  AveragetBodyGyro-std()-Y          
  AveragetBodyGyro-std()-Z          
  AveragetBodyGyroJerk-mean()-X     
  AveragetBodyGyroJerk-mean()-Y     
  AveragetBodyGyroJerk-mean()-Z     
  AveragetBodyGyroJerk-std()-X      
  AveragetBodyGyroJerk-std()-Y      
  AveragetBodyGyroJerk-std()-Z      
  AveragetBodyAccMag-mean()         
  AveragetBodyAccMag-std()          
  AveragetGravityAccMag-mean()      
  AveragetGravityAccMag-std()       
  AveragetBodyAccJerkMag-mean()     
  AveragetBodyAccJerkMag-std()      
  AveragetBodyGyroMag-mean()        
  AveragetBodyGyroMag-std()         
  AveragetBodyGyroJerkMag-mean()    
  AveragetBodyGyroJerkMag-std()     
  AveragefBodyAcc-mean()-X          
  AveragefBodyAcc-mean()-Y          
  AveragefBodyAcc-mean()-Z          
  AveragefBodyAcc-std()-X           
  AveragefBodyAcc-std()-Y           
  AveragefBodyAcc-std()-Z           
  AveragefBodyAccJerk-mean()-X      
  AveragefBodyAccJerk-mean()-Y      
  AveragefBodyAccJerk-mean()-Z      
  AveragefBodyAccJerk-std()-X       
  AveragefBodyAccJerk-std()-Y       
  AveragefBodyAccJerk-std()-Z       
  AveragefBodyGyro-mean()-X 
  AveragefBodyGyro-mean()-Y    
  AveragefBodyGyro-mean()-Z         
  AveragefBodyGyro-std()-X          
  AveragefBodyGyro-std()-Y          
  AveragefBodyGyro-std()-Z          
  AveragefBodyAccMag-mean()         
  AveragefBodyAccMag-std()          
  AveragefBodyBodyAccJerkMag-mean()                                                   
  AveragefBodyBodyAccJerkMag-std()  
  AveragefBodyBodyGyroMag-mean()  
  AveragefBodyBodyGyroMag-std()    
  AveragefBodyBodyGyroJerkMag-mean()                                                                 
  AveragefBodyBodyGyroJerkMag-std() 

**Feature Selection**

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

There are 33 feature variables for average mean() and 33 feature variables for average std()


