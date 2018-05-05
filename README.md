# Getting and Cleaning Data - Course Project

The R script, "run_analysis.R", does the following steps to create a final tidy data:

1 Read data.
 - Read test data
 - Read features
 - Read activity labels

2. Merge the training and the test sets to create one data set:
 - Merging Subject Data
 - Merging the Activity Data
 - Merging the Feature Data
 - Set names to variables
 - Merging all data

3. Extracts only the measurements on the mean and standard deviation for each measurement.
 - Select only columns with mean() or std() in their names
       subset the desired columns

4. Uses descriptive activity names to name the activities in the data set

5. Appropriately labels the data set with descriptive variable names

6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject

7. Save the final tidy data to tidy.txt file.
