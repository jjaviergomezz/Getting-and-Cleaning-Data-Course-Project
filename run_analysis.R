

## DOWNLOADING AND DECOMPRESSING THE FILE:

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "download.zip")
unzip("download.zip")


## READING THE DATA

## A) Training data:

STrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")

BAXTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
BAYTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
BAZTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
BGXTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
BGYTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
BGZTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
TAXTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
TAYTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
TAZTrain <- read.table(
        "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

## B) Test data:

STest <- read.table("UCI HAR Dataset/test/subject_test.txt")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt")

BAXTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
BAYTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
BAZTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
BGXTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
BGYTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
BGZTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
TAXTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
TAYTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
TAZTest <- read.table(
        "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

## LABELING WITH DESCRIPTIVE VARIABLE NAMES AND PREPARING FEATURES'
## VARIABLES TO EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD
## DEVIATION FOR EACH MEASUREMENT.

names(STrain) <- "Subject"
names(STest)  <- "Subject"

names(YTrain) <- "Activity"
names(YTest)  <- "Activity"

features <- read.table("UCI HAR Dataset/features.txt")

names(XTrain) <- features$V2
names(XTest)  <- features$V2

select <- grep("mean\\()|std\\()", features$V2)

SelectXTrain <- XTrain[, select]
SelectXTest  <- XTest[, select]


## MERGING THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET:

## By columns for training data:

SelectTrain <- cbind(STrain, YTrain, SelectXTrain)

## The same for test data:

SelectTest <- cbind(STest, YTest, SelectXTest)

## And finally we join both datasets by rows:

SelectDataSet <- rbind(SelectTrain, SelectTest)


## USING DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET:


ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
ActivityAsFactor <- as.factor(SelectDataSet$Activity)
levels(ActivityAsFactor) <- ActivityLabels$V2
SelectDataSet$Activity <- ActivityAsFactor


## CREATING AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE
## FOR EACH ACTIVITY AND EACH SUBJECT:

library(reshape2)

l <- length(names(SelectDataSet))
MeasureVars <- names(SelectDataSet)[3:l]
MeltedData <- melt(SelectDataSet,id=c("Activity", "Subject"), measure.vars=MeasureVars)

CastedData <- dcast(MeltedData, Activity + Subject ~ variable, mean)

FinalData <- melt(CastedData, id=c("Activity", "Subject"), measure.vars=MeasureVars) 

library(dplyr)

FinalData <- arrange(FinalData, as.character(Activity), Subject)

write.table(FinalData, "finaldataset.txt", row.names = FALSE)



