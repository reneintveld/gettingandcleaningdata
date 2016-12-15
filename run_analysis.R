runanalysis <- function() 

#to run this input program:  First, go to the proper directory
#eg. setwd("~/R/coursera/")
#use dir() to find the correct program name
#source("run_analysis.R") 
#runanalysis

{
  

#0. Read the datasets
  
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

temp <- tempfile()
download.file(url4,temp)
data4 <- unzip(temp)
unlink(temp)

#inspect the 28 files
data4

#1.	Merges the training and the test sets to create one data set.

# we need only to read files 14,15,16 (test set) and 26,27,28 (training set)

# first read the training set of csv files without header and seperated by spaces

subtest <- read.csv(data4[14], header=FALSE)
vartest <- read.csv(data4[15], header=FALSE, sep="")
acttest <- read.csv(data4[16], header=FALSE)

# then read the training set of csv files without header and seperated by spaces

subtrain <- read.csv(data4[26], header=FALSE)
vartrain <- read.csv(data4[27], header=FALSE, sep="")
acttrain <- read.csv(data4[28], header=FALSE)

#now add the training set to the test set

sub <- rbind(subtest,subtrain)
act <- rbind(acttest,acttrain)
var <- rbind(vartest,vartrain)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.

# first give names to the variables

names(sub) <- c("subject")
names(act) <- c("activity")
features <- read.csv(data4[2], header=FALSE, sep="")
feat <- features[,2]
names(var) <- feat

fulldb <- cbind(sub,act)
#add only 6 variables with mean() and std()
fulldb <- cbind(fulldb, var[1:6]) 

#3.	Uses descriptive activity names to name the activities in the data set

activities <- read.csv(data4[1], header=FALSE, sep="")
names(activities) <- c("activity", "activitylabel")
fulldb <- merge(activities, fulldb)

#4.	Appropriately labels the data set with descriptive variable names.
# is already done

save(fulldb, file = "database4.Rdata")

#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

database5 <- aggregate(fulldb[, 4:9], list(fulldb$activitylabel, fulldb$subject), mean)
names(database5)[1:2] <- c("activitylabel", "subject")

save(database5, file = "database5.Rdata")

}
