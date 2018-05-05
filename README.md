# Getting and Cleaning Data - Course Project

The R script, "run_analysis.R", does the following steps to create a final tidy data:

1.1. Read data
 1.2. Read test data
 1.3. Read features
 1.4. Read activity labels

2. Merge the training and the test sets to create one data set:
 2.1. Merging Subject Data
 2.2. Merging the Activity Data
 2.3. Merging the Feature Data
 2.4. Set names to variables
 2.5. Merging all data

3. Extracts only the measurements on the mean and standard deviation for each measurement.
 3.1. Select only columns with mean() or std() in their names
       subset the desired columns

4. Uses descriptive activity names to name the activities in the data set

5. Appropriately labels the data set with descriptive variable names

6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject

7. Save the final tidy data to tidy.txt file.
