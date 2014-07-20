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
- refer to the **CodeBook** to see the detailed steps used to create the tidy_data data.table as well as details on the source data used for this analysis.

**store_tidy_data**
- this script was used to store the tidy_data data table on my hard drive so it could be uploaded to github.  

**Overview of Data in Tidy_Data**
=================================   
The "tidy\_data" set has 180 rows of data.  There were 30 participants in this study that were each measured for 6 distint activities. Averages for each measured feature value are presented for every participant for each activity (6 rows of data for each participant).  The columns contained in the "tidy\_data" are documented below.  There was a total of 10299 data rows that were grouped by Participant and Activity with the Average calculated for columns 4-69 which are described in detail below.

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
Number - there are 66 columns of variables. These columns were selected from the 561 original feature columns because they contained the mean() and std() observations.   The tidy_data dataset contains the Average for each column by Participant and Activity.

Of the 66 variables, 33 features are for mean() and 33 features are for std()

Complete list of **column names** for Columns 4-69:
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
  fBodyBodyGyroJerkMag-std()  

