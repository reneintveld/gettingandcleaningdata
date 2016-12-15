---
title: "Peer assessment Getting and Cleaning data"
author: "Rene int Veld"
date: "Sunday, December 18, 2016"
output: html_document
---

## Introduction project

One of the most exciting areas in all of data science right now is wearable computing - see for example http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/.
The point here is this: When we think about activity tracking and sports, we should not think devices sold, but about the data created for any vertical.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

In this project, our goal will be goal is to prepare tidy data that can be used for later analysis. 
We will create:
1) a tidy data set as described below, 
2) a link to a Github repository with our script for performing the analysis, 3) a code book (CodeBook.md) that describes the variables, the data, and any transformations or work that we performed to clean up the data.
4) a README.md in the Github repo, explaining how all of the scripts work and how they are connected.


## Loading and preprocessing the data

Data: The training data for this project are available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We have created a R script called run_analysis.R that does the following:

a) Merges the training and the test sets to create one data set.
b) Extracts only the measurements on the mean and standard deviation for each measurement.
c) Uses descriptive activity names to name the activities in the data set.
d) Appropriately labels the data set with descriptive variable names.
e) From the data set in step d, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

We have stored the above script 

in local environment for this peer assessment:

```{r}

```

## Conclusion

Because of the number of the variables and the spread in the results it is quite difficult to predict which prediction method works best. After we first had a reasonable result of 73% with the Linear Discriminant Analysis we could hugely improve with the random forest method, although this is around 1000x slower. So a clear pay off between speed and accuracy.