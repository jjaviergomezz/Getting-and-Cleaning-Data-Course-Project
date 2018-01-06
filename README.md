


#### **1. Downloading and unzipping the file** 

  First of all, we download and unzip the zip file:

```{r}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "download.zip")
unzip("download.zip")
```


#### **2. Reading the data**


  Then, we can read all the files contained in it:


##### **A) Training data**


```{r}
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
```


##### **B) Test data**


```{r}
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
```

  The aim is get a data set with only the measurements on the mean and standard deviation for each measurement. Variables regarding to inertial signals don't have recognizable names, so that we're going to work without them.
  
  I'm going to rename the variables relative to subject and activity in step 3 and select those with "mean()" or "std()" into their names in step 4.
       
#### **3. Labeling with descriptive variable names**

```{r}
names(STrain) <- "Subject"
names(STest)  <- "Subject"

names(YTrain) <- "Activity"
names(YTest)  <- "Activity"

features <- read.table("UCI HAR Dataset/features.txt")

names(XTrain) <- features$V2
names(XTest)  <- features$V2
```
#### **4. Extracting the measurements on the mean and standard deviation
#### for each measurement**
```{r}
select <- grep("mean\\()|std\\()", features$V2)

SelectXTrain <- XTrain[, select]
SelectXTest  <- XTest[, select]
```

#### **5. Merging the training and test sets to create one data set**

  Now we can merge all this data, by columns (variables) first, and then
by rows (training and test data).

##### By columns for training data:
```{r}
SelectTrain <- cbind(STrain, YTrain, SelectXTrain)
```
##### The same for test data:
```{r}
SelectTest <- cbind(STest, YTest, SelectXTest)
```
##### And finally we join both datasets by rows:
```{r}
SelectDataSet <- rbind(SelectTrain, SelectTest)
```

#### **6. Using descriptive activity names to name the activities in the data set**

  We label the activities:
```{r}
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
ActivityAsFactor <- as.factor(SelectDataSet$Activity)
levels(ActivityAsFactor) <- ActivityLabels$V2
SelectDataSet$Activity <- ActivityAsFactor
```
#### **7. Creating an independent tidy data set with the average of each variable for each activity and each subject**

  Now, making use of the `reshape2` package, we can create a new variable, with the names of the measure variables as its values and their means as their matched values.
```{r}
library(reshape2)
l <- length(names(SelectDataSet))
MeasureVars <- names(SelectDataSet)[3:l]
MeltedData <- melt(SelectDataSet,
        id=c("Subject", "Activity"),measure.vars=MeasureVars)

CastedData <- dcast(MeltedData, Subject + Activity ~ variable, mean)

FinalData <- melt(CastedData,
        id=c("Subject", "Activity"), measure.vars=MeasureVars)
```
  Finally, with the `dplyr` package, we arrange the dataframe based on 
Subject value first, and Activity value afterwards.
```{r}
library(dplyr)
FinalData <- arrange(FinalData, Subject, Activity)
```

#### **8. Sending the final tidy data set**

  For send the final data set, we use the next sentence:
```{r}  
write.table(FinalData, "dataset.txt", row.names = FALSE)
```




