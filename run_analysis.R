## this is the run_analysis function that I wrote which contains
## all the steps needed to read the text files and create a 
## tidy_data data.table  
## after running the function, the global environment will contain
## a tidy_data data frame that contains 180 rows as well as an 
## obs_dt data frame that contains 10299 unsummarized rows of data

run_analysis <- function () {
##this script requires the data.table library
library(data.table)

##set directory - get features (column headings) and activity_labels
path <- "./UCI HAR Dataset"
setwd(path)
features <- read.table("features.txt")
act_labels <- read.table("activity_labels.txt")
names(act_labels) <- c("activity", "ActivityName")

## set directory to get "test" data
## then get X_test data and subject_test data and add column names
setwd("./test")
X_test <- read.table("X_test.txt")
names(X_test) <- features[,2]
subject_test <- read.table("subject_test.txt")
names(subject_test) <- "participant"
act_test <- read.table("y_test.txt")
names(act_test) <- "activity"

## to find columns with std and mean 
sub_features <- features[grep("-mean|-std", features$V2),]
## remove meanFreq from data
sub_features <- sub_features[grep("meanFreq", sub_features$V2,invert=T),]
subtest <- X_test[, c(sub_features[,1])]

## combine column data from subtest, subject_test and act_test
test_data <- cbind(cbind(subject_test, act_test), subtest)

##repeat same steps for training data to get data from working dir
setwd("../train")
X_train <- read.table("X_train.txt")
names(X_train) <- features[,2]
subject_train <- read.table("subject_train.txt")
names(subject_train) <- "participant"
act_train <- read.table("y_train.txt")
names(act_train) <- "activity" 

## shorten X_train to needed columns - reuse sub_features for this
subtrain <- X_train[, c(sub_features[,1])]
## combine column data from subtest, subject_test and act_test
train_data <- cbind(cbind(subject_train, act_train), subtrain)

## combine test and train data and merge activity names
tot_data <- rbind(test_data, train_data)
tot_datax <- merge(tot_data, act_labels, all=FALSE)

## convert to data table and then summarize by participant and activity
obs_dt <<- data.table(tot_datax)
##add Average to the field names
xname <- names(obs_dt)
xname[3:68] <- paste0("Average", c(xname[3:68]))
setnames(obs_dt, names(obs_dt), xname)

avg_obs <-obs_dt[,lapply(.SD,mean),
                 by=c("participant", "activity", "ActivityName")]
tidy_data <<- avg_obs[order(avg_obs$participant, avg_obs$activity),]

}
