  
## **Code Book**
### **Tidy Data Set of Averaged Statistics (Means and Standard Deviations) over Measures from *Human Activity Recognition Using Smartphones Dataset* Arranged by Activity and Subject**  
  
    
The tidy data set given in **`tidydataset.txt`** was obtained with the **`run_analysis.R`** code archive, that works over Human Activity Recognition Using Smartphones Dataset [**(zip file)**](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from this web site:  [**link**](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The experiments were carried out with a group of **30 volunteers** within an age bracket of 19-48 years. Each person performed **six activities**:  
  
- **`WALKING`**
- **`WALKING_UPSTAIRS`**
- **`WALKING_DOWNSTAIRS`**
- **`SITTING`**
- **`STANDING`**
- **`LAYING`**
  
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers (see License paragraph) captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were  video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

**NOTE 1:** The sensor signals are not considered in the modified data set. Let's therefore pre-select:   
- A 561-feature vector with time and frequency domain variables. (`X_train` and `X_test`, bold in next paragraph)  
- Its activity label. (The same with `y_`.)  
- An identifier of the subject who carried out the experiment. (The same with `subject_`.)  

#### **The dataset includes the following files:**

- `'README.txt'`

- `'features_info.txt'`: Shows information about the variables used on the feature vector.

- `'features.txt'`: List of all features.

- `'activity_labels.txt'`: Links the class labels with their activity name.

- **`'train/X_train.txt'`:** Training set.  

- **`'train/y_train.txt'`:** Training labels.

- **`'test/X_test.txt'`:** Test set.

- **`'test/y_test.txt'`:** Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- **`'train/subject_train.txt'`:** Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- `'train/Inertial Signals/total_acc_x_train.txt'`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- `'train/Inertial Signals/body_acc_x_train.txt'`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- `'train/Inertial Signals/body_gyro_x_train.txt'`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### **Feature Selection**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the `'f'` to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
`'-XYZ'` is used to denote 3-axial signals in the X, Y and Z directions.

- `tBodyAcc-XYZ`  
- `tGravityAcc-XYZ`  
- `tBodyAccJerk-XYZ`  
- `tBodyGyro-XYZ`  
- `tBodyGyroJerk-XYZ`  
- `tBodyAccMag`  
- `tGravityAccMag`  
- `tBodyAccJerkMag`  
- `tBodyGyroMag`  
- `tBodyGyroJerkMag`  
- `fBodyAcc-XYZ`  
- `fBodyAccJerk-XYZ`  
- `fBodyGyro-XYZ`  
- `fBodyAccMag`  
- `fBodyAccJerkMag`  
- `fBodyGyroMag`  
- `fBodyGyroJerkMag`    

The set of variables that were estimated from these signals are: 

- **`mean()`: Mean value**  
- **`std()`: Standard deviation**    
- `mad()`: Median absolute deviation   
- `max()`: Largest value in array  
- `min()`: Smallest value in array  
- `sma()`: Signal magnitude area  
- `energy()`: Energy measure. Sum of the squares divided by the number of values.   
- `iqr()`: Interquartile range   
- `entropy()`: Signal entropy  
- `arCoeff()`: Autorregresion coefficients with Burg order equal to 4  
- `correlation()`: correlation coefficient between two signals  
- `maxInds()`: index of the frequency component with largest magnitude  
- `meanFreq()`: Weighted average of the frequency components to obtain a mean frequency  
- `skewness()`: skewness of the frequency domain signal   
- `kurtosis()`: kurtosis of the frequency domain signal   
- `bandsEnergy()`: Energy of a frequency interval within the 64 bins of the FFT of - each window.  
- `angle()`: Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- `gravityMean`  
- `tBodyAccMean`  
- `tBodyAccJerkMean`  
- `tBodyGyroMean`  
- `tBodyGyroJerkMean`  

The complete list of variables of each feature vector is available in `'features.txt'`  

**NOTE 2:** After inspecting the series of names of the measured and calculated variables we only use feature variables with **"mean()"** and **"std()"** into their names to build the final tidy dataset. 

The **final list of variables (68)** would then be the next:

- `Subject`  
- `Activity`  
- `tBodyAcc-mean()-X`  
- `tBodyAcc-mean()-Y`  
- `tBodyAcc-mean()-Z`  
- `tBodyAcc-std()-X`             
- `tBodyAcc-std()-Y`  
- `tBodyAcc-std()-Z`             
- `tGravityAcc-mean()-X`  
- `tGravityAcc-mean()-Y`         
- `tGravityAcc-mean()-Z`  
- `tGravityAcc-std()-X`  
- `tGravityAcc-std()-Y`  
- `tGravityAcc-std()-Z`          
- `tBodyAccJerk-mean()-X`  
- `tBodyAccJerk-mean()-Y`        
- `tBodyAccJerk-mean()-Z`  
- `tBodyAccJerk-std()-X`         
- `tBodyAccJerk-std()-Y`  
- `tBodyAccJerk-std()-Z`  
- `tBodyGyro-mean()-X`  
- `tBodyGyro-mean()-Y`  
- `tBodyGyro-mean()-Z`  
- `tBodyGyro-std()-X`  
- `tBodyGyro-std()-Y`  
- `tBodyGyro-std()-Z`            
- `tBodyGyroJerk-mean()-X`  
- `tBodyGyroJerk-mean()-Y`       
- `tBodyGyroJerk-mean()-Z`  
- `tBodyGyroJerk-std()-X`        
- `tBodyGyroJerk-std()-Y`  
- `tBodyGyroJerk-std()-Z`        
- `tBodyAccMag-mean()`  
- `tBodyAccMag-std()`            
- `tGravityAccMag-mean()`  
- `tGravityAccMag-std()`  
- `tBodyAccJerkMag-mean()`  
- `tBodyAccJerkMag-std()`        
- `tBodyGyroMag-mean()`  
- `tBodyGyroMag-std()`           
- `tBodyGyroJerkMag-mean()`  
- `tBodyGyroJerkMag-std()`       
- `fBodyAcc-mean()-X`  
- `fBodyAcc-mean()-Y`            
- `fBodyAcc-mean()-Z`  
- `fBodyAcc-std()-X`             
- `fBodyAcc-std()-Y`  
- `fBodyAcc-std()-Z`             
- `fBodyAccJerk-mean()-X`  
- `fBodyAccJerk-mean()-Y`        
- `fBodyAccJerk-mean()-Z`  
- `fBodyAccJerk-std()-X`         
- `fBodyAccJerk-std()-Y`  
- `fBodyAccJerk-std()-Z`         
- `fBodyGyro-mean()-X`  
- `fBodyGyro-mean()-Y`           
- `fBodyGyro-mean()-Z`  
- `fBodyGyro-std()-X`            
- `fBodyGyro-std()-Y`  
- `fBodyGyro-std()-Z`            
- `fBodyAccMag-mean()`  
- `fBodyAccMag-std()`            
- `fBodyBodyAccJerkMag-mean()`  
- `fBodyBodyAccJerkMag-std()`    
- `fBodyBodyGyroMag-mean()`  
- `fBodyBodyGyroMag-std()`       
- `fBodyBodyGyroJerkMag-mean()`  
- `fBodyBodyGyroJerkMag-std()`  

**NOTE 3:** Features are normalized and bounded within [-1,1].

#### **Reshaping the data set:**

We create an independent tidy data set with the average of each selected measure (means and standard deviations from the measures obtained in the experiment) for each activity and each subject. Then, we arrange the dataframe by Activity and by Subject afterwards.

For more details, read `README.md`, where the steps of the entire analysis are explained.  

#### **License of the original dataset:**

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living. Vitoria-Gasteiz, Spain. Dec 2012

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

