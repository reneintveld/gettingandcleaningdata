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

#1.	Merge the training and the test sets to create one data set.

# we need only to read files 14,15,16 (test set) and 26,27,28 (training set)
# the other files contain the raw data which are processed in the X-files
# (X-train.txt and X-test.txt)

# first read the training set of csv files without header and seperated by spaces

subjecttest <- read.csv(data4[14], header=FALSE)
featuretest <- read.csv(data4[15], header=FALSE, sep="")
activitytest <- read.csv(data4[16], header=FALSE)

# then read the training set of csv files without header and seperated by spaces

subjecttrain <- read.csv(data4[26], header=FALSE)
featuretrain <- read.csv(data4[27], header=FALSE, sep="")
activitytrain <- read.csv(data4[28], header=FALSE)

#now add the training set to the test set

sub <- rbind(subjecttest,subjecttrain)
act <- rbind(activitytest,activitytrain)
var <- rbind(featuretest,featuretrain)

#2 Extract only the measurements on the mean and standard deviation for each measurement.

# first give names to the variables
# the sub and act file have only one column:
names(sub) <- c("subject")
names(act) <- c("activity")

# the names of the features are in 2nd column of the file called feature.txt
featurenames <- read.csv(data4[2], header=FALSE, sep="")
featnam <- featurenames[,2]
names(var) <- featnam

# the variables file has to be limited to only the 2x33 features with mean() or std() in the description
varm1 <- var[ , grep("-mean", colnames(var))]
varmean <- varm1[ , -grep("-meanFreq", colnames(varm1))]
varstd <- var[ , grep("-std", colnames(var))]
varmeanstd <- cbind(varmean,varstd)

# now add the subjects and activities
subact <- cbind(sub,act)
db1 <- cbind(subact,varmeanstd)

#3.	Use descriptive activity names to name the activities in the data set

activitienames <- read.csv(data4[1], header=FALSE, sep="")
names(activitienames) <- c("activity", "activitylabel")
fulldb <- merge(activitienames, db1)

#4.	Appropriately label the data set with descriptive variable names.
# is already done

save(fulldb, file = "database4.Rdata")

#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

database5 <- aggregate(fulldb[, 4:69], list(fulldb$activitylabel, fulldb$subject), mean)
names(database5)[1:2] <- c("activitylabel", "subject")

save(database5, file = "database5.Rdata")

write.csv(database5, file="tidy dataset.csv")

}
