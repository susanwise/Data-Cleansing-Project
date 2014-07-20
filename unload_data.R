##establish data directory if it does already exist
if(!file.exists("./data")){dir.create("./data")}
setwd("./data")

## one time activity to get the zip file onto my hard drive
temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,temp)

unzip(temp, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
unlink(temp)
