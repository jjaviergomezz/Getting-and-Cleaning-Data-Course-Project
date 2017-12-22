
## Download and decompression of the file:

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "download.zip")
unzip("download.zip")

## Setting the work directory at our dataset:

setwd(paste0(getwd(), "/UCI HAR Dataset"))