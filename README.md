Data-Cleansing-Project
======================
This repository contains the Project artifacts for the Coursera Data Clensing class.   

The following files/scripts are attached to this project.  
**unload_data** 
- this script will create a "data" directory if it does not exist and will unload the URL to this directory on your hard drive.   This is preliminary work that is required before executing the run_analysis function

**run_analysis** 
- This script contains a function run\_analysis that will create the tidy data using the data that was unloaded using the unload\_data script.   
- For this function to run correctly, the working directory must be set to the "data" directory before executing (or wherever you unloaded the Zip file).   To verify the directory is correct, execute the dir() command and validate that "UCI HAR Dataset" is listed.
- The output of this function will be a tidy\_data data.table that contains aggregate data (the class requirement) and an obs\_dt data frame that contains the unsummarized data.  The columns are the same in each data frame.
- steps used to create the tidy\_data data.table are listed below.  Refer to the **CodeBook** to see details on the source data used for this analysis as well as additional information on the tidy\_data. 

**store_tidy_data**
- this script was used to store the tidy_data data table on my hard drive so it could be uploaded to github.  

**Steps to create Tidy Data**
=============================
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
=================================   
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
Number - there are 66 columns of variables. These columns were selected from the 561 original feature columns because they contained the mean() and std() observations.   The tidy_data dataset contains the Average for each column by Participant and Activity.

Of the 66 variables, 33 features are for mean() and 33 features are for std()

Complete list of **column names** for Columns 4-69:
  
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

