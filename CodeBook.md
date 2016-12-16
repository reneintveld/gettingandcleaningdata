---
title: "Peer assessment Getting and Cleaning data"
author: "Rene int Veld"
date: "Friday, December 16, 2016"
output: html_document
---

## Introduction project

In this project, our goal will be to prepare tidy data that can be used for later analysis from data sourced by wearable computing.
Please refer to README.md for a further background on this project.

## Source data

The source data is coming from the Human Activity Recognition Database, which  is built from 10299 recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the research group captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The data for this project are available here:    
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen on youtube:   https://www.youtube.com/watch?v=XOEN9W05_4A

The raw sensor information was captured in 9 files of 10299 rows and 128 columns (both training and test set).  
The research group has condensed this information into one file of 10299 rows and 561 columns called features. (again this file was split into a training and test set).

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

The features -XYZ are split in 3 components, -X, -Y, -Y.  
This way we create 33 signals.

The set of variables that were estimated from these 33 signals are:   

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in 'features.txt'

## Analysis dataset

In this project we were asked to extract only the mean and standard deviation of the measurements for further analysis. So we selected only variables containing the string mean() and stdev(). This way we have 33 variables with mean() and 33 with stdev().

NB. variables with strings like meanFreq() are not selected.

Based on the available information we have added 2 additional columns:  
* Its activity label (1..6)  
* An identifier of the subject who carried out the experiment (1..30).

Furthermore we replaced the activity number with the activity name as follows:  
1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

Notes:    
- Features are normalized and bounded within [-1,1]  
- Each feature vector is a row on the text file.  

As explained before, we did not use the raw data in the folders called Inertial Signals (9 train-files and 9 test-files with in txt format for each of the 3 coordinates (x,y,z) and each of the 3 accelarations: body, gyro and total). 

The condensed data is captured in X_train and X_test.  
The activity labels are captured in y_train and y_test.  
The subject numbers are captured in subject_train and subject_test.  

We have created a R script called run_analysis.R that does the following:    
* a. Merges the training and the test sets to create one data set.
* b. Extracts only the measurements on the mean and standard deviation for each measurement.
* c. Uses descriptive activity names to name the activities in the data set.
* d. Appropriately labels the data set with descriptive variable names.
* e. From the data set in step d, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy dataset

The tidy dataset is a txt file called Wearable Data file, also stored in this repository.  
This set consists of 180 rows (for each of 30 subjects x 6 activities), and 68 columns (activity name, subject number and the average values of 33 means variables and 33 st.dev. variables):  

activitylabel  
subject  
tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z  
tGravityAcc-mean()-X  
tGravityAcc-mean()-Y  
tGravityAcc-mean()-Z  
tBodyAccJerk-mean()-X  
tBodyAccJerk-mean()-Y  
tBodyAccJerk-mean()-Z  
tBodyGyro-mean()-X  
tBodyGyro-mean()-Y  
tBodyGyro-mean()-Z  
tBodyGyroJerk-mean()-X  
tBodyGyroJerk-mean()-Y  
tBodyGyroJerk-mean()-Z  
tBodyAccMag-mean()  
tGravityAccMag-mean()  
tBodyAccJerkMag-mean()  
tBodyGyroMag-mean()  
tBodyGyroJerkMag-mean()  
fBodyAcc-mean()-X  
fBodyAcc-mean()-Y  
fBodyAcc-mean()-Z  
fBodyAccJerk-mean()-X  
fBodyAccJerk-mean()-Y  
fBodyAccJerk-mean()-Z  
fBodyGyro-mean()-X  
fBodyGyro-mean()-Y  
fBodyGyro-mean()-Z  
fBodyAccMag-mean()  
fBodyBodyAccJerkMag-mean()  
fBodyBodyGyroMag-mean()  
fBodyBodyGyroJerkMag-mean()  
tBodyAcc-std()-X  
tBodyAcc-std()-Y  
tBodyAcc-std()-Z  
tGravityAcc-std()-X  
tGravityAcc-std()-Y  
tGravityAcc-std()-Z  
tBodyAccJerk-std()-X  
tBodyAccJerk-std()-Y  
tBodyAccJerk-std()-Z  
tBodyGyro-std()-X  
tBodyGyro-std()-Y  
tBodyGyro-std()-Z  
tBodyGyroJerk-std()-X  
tBodyGyroJerk-std()-Y  
tBodyGyroJerk-std()-Z  
tBodyAccMag-std()   
tGravityAccMag-std()  
tBodyAccJerkMag-std()  
tBodyGyroMag-std()  
tBodyGyroJerkMag-std()  
fBodyAcc-std()-X  
fBodyAcc-std()-Y  
fBodyAcc-std()-Z  
fBodyAccJerk-std()-X  
fBodyAccJerk-std()-Y  
fBodyAccJerk-std()-Z  
fBodyGyro-std()-X  
fBodyGyro-std()-Y  
fBodyGyro-std()-Z  
fBodyAccMag-std()  
fBodyBodyAccJerkMag-std()  
fBodyBodyGyroMag-std()  
fBodyBodyGyroJerkMag-std()  

## Conclusion

With the tidy data set we could do several further analyses, for instance try to register which activity a subject is doing based on the sensor data. Eg. with machine learning we could predict the activity name based on the 66 measurements.
