

library(plyr)

# Download and unzip the required zip file:

fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

ZipFileName <- "Getdata_ProjectFiles_Dataset.zip"

download.file(fileURL, ZipFileName, method="curl")

if(!file.exists("./UCI HAR Dataset")) {
  unzip(ZipFileName)
}

#########################
#1. Read the data files.#
#########################

# read training data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read features
features <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activities <-  read.table("./UCI HAR Dataset/activity_labels.txt")

##################################################################
# 2. Merge the training and the test sets to create one data set.#
##################################################################

# Merging Subject Data
subData <- rbind(subjectTrain, subjectTest)

#Merging the Activity Data
yActData <- rbind(yTrain, yTest)

# Merging the Feature Data
xFeatData <- rbind(xTrain, xTest)

# set names to variables
names(subData)   <- "subject"
names(yActData) <- "activity"
names(xFeatData) <- features$V2

# Merding all data
allData <- cbind(subData, yActData, xFeatData)

#############################################################################################
# 3. Extracts only the measurements on the mean and standard deviation for each measurement.#
#############################################################################################

#seltect only columns with mean() or std() in their names
sub_data_FeaturesNames <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

# subset the desired columns
selectedNames<- c(as.character(sub_data_FeaturesNames), "subject", "activity" )
allData <- subset(allData, select=selectedNames)

###########################################################################
#4. Uses descriptive activity names to name the activities in the data set#
###########################################################################

allData$activity <- activities[allData$activity, 2]

#######################################################################
#5. Appropriately labels the data set with descriptive variable names.#
#######################################################################

names(allData) <-gsub("^t", "time", names(allData))
names(allData) <-gsub("^f", "frequency", names(allData))
names(allData) <-gsub("Acc", "Accelerometer", names(allData))
names(allData) <-gsub("Gyro", "Gyroscope", names(allData))
names(allData) <-gsub("Mag", "Magnitude", names(allData))
names(allData) <-gsub("BodyBody", "Body", names(allData))

#############################################################################
#6. From the data set in step 4, creates a second, independent tidy data set#
#with the average of each variable for each activity and each subject.#######
#############################################################################

# group by subject and activity and summarise using mean

tidyData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

###############################################
#7. Save the final tidy data to tidy.txt file.#
###############################################
write.table(tidyData, "tidy.txt", row.name=FALSE)
