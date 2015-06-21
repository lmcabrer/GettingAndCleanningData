---
output: pdf_document
---
# Description

This folder contains the files required by the project description of the Course: 
_Getting and Cleaning Data_.

The folder contains 3 files. 

1. README.md: this is the present file with the necessary explanations about the project and the folder contents.

2. run_analysis.R: This contains the script perfoming the activities requiered by the project description and detailed in the following section.

3. Summary.txt: a text file containing the final dataset required by the project. (This can also be obtained using the R script).

# Explanation of the modifications performed

The original dataset contained 561 variables. The names and the descriptions of each of these variables can be found the features.txt and features_info.tx in original zip file.

We preformed a number of transformations to those variables following the instructions 2 and 3 in of the project description:
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set


Step 1. To produce this we first included the Subject number, and the Activity for each measurement. The numbers of the activities were replaced by manful names for each of them. The names were extracted from the activity_labels.txt file.

Step 2. After that we modified the variable names in features.txt to obtain valid R-readable variable names, eliminating symbols like "(" ")" and "-". After doing this we observed that there were some repeated names, these variables are not included in the final dataset(*).

Step 3. We selected the variable names that contained the word "mean" of "std"

Step 4. We modified the prefix "t" and "f" by "Time" and "Frequency" 

Step 5.  We replaced "Acc" by "Acceleration".

Step 6. We replaced "mean" and "std" by "Mean" and "Std" to make the variable names more readable.

After these transformations we obtained 67 variables (listed below) and a total of 10299 observations for each of them.

Following the last instruction:
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject,

we produced a dataset with the required averages and we added the prefix "Average." to the name of each variable. 

(*) To automatically process the name of the variables we added to them suffix (numeric) to distiguish all the variable names. After selecting the ones we were interested in, the suffix was eliminated; and after this selection there weren't repated variable names.


# CODE BOOK
List of Variables in merged cleaned dataset
-------------------------------------------
* Subject (integer, only a number indicating the identifier of the subject)
* Activity (factor: WALKING, WALKING_ UPSTAIRS, WALKING_ DOWNSTAIRS, SITTING, STANDING, LAYING)

All the following variables are of float type. I couldn't find the specific units of the variables in the original dataset. Therefore, I cannot provide the unit for the ones in the tidy dataset.

* TimeBodyAccelerationMeanX
* TimeBodyAccelerationMeanY
* TimeBodyAccelerationMeanZ
* TimeBodyAccelerationStdX
* TimeBodyAccelerationStdY
* TimeBodyAccelerationStdZ
* TimeGravityAccelerationMeanX
* TimeGravityAccelerationMeanY
* TimeGravityAccelerationMeanZ
* TimeGravityAccelerationStdX
* TimeGravityAccelerationStdY
* TimeGravityAccelerationStdZ
* TimeBodyAccelerationJerkMeanX
* TimeBodyAccelerationJerkMeanZ
* TimeBodyAccelerationJerkStdX
* TimeBodyAccelerationJerkStdY
* TimeBodyAccelerationJerkStdZ
* TimeBodyGyroMeanX
* TimeBodyGyroMeanY
* TimeBodyGyroMeanZ
* TimeBodyGyroStdX
* TimeBodyGyroStdY
* TimeBodyGyroStdZ
* TimeBodyGyroJerkMeanX
* TimeBodyGyroJerkMeanY
* TimeBodyGyroJerkMeanZ
* TimeBodyGyroJerkStdX
* TimeBodyGyroJerkStdY
* TimeBodyGyroJerkStdZ
* TimeBodyAccelerationMagMean
* TimeBodyAccelerationMagStd
* TimeGravityAccelerationMagMean
* TimeGravityAccelerationMagStd
* TimeBodyAccelerationJerkMagMean
* TimeBodyAccelerationJerkMagStd
* TimeBodyGyroMagMean
* TimeBodyGyroMagStd
* TimeBodyGyroJerkMagMean
* TimeBodyGyroJerkMagStd
* FrequencyBodyAccelerationMeanX
* FrequencyBodyAccelerationMeanY
* FrequencyBodyAccelerationMeanZ
* FrequencyBodyAccelerationStdX
* FrequencyBodyAccelerationStdY
* FrequencyBodyAccelerationStdZ
* FrequencyBodyAccelerationJerkMeanX
* FrequencyBodyAccelerationJerkMeanY
* FrequencyBodyAccelerationJerkMeanZ
* FrequencyBodyAccelerationJerkStdX
* FrequencyBodyAccelerationJerkStdY
* FrequencyBodyAccelerationJerkStdZ
* FrequencyBodyGyroMeanX
* FrequencyBodyGyroMeanY
* FrequencyBodyGyroMeanZ
* FrequencyBodyGyroStdX
* FrequencyBodyGyroStdY
* FrequencyBodyGyroStdZ
* FrequencyBodyAccelerationMagMean
* FrequencyBodyAccelerationMagStd
* FrequencyBodyBodyAccelerationJerkMagMean
* FrequencyBodyBodyAccelerationJerkMagStd
* FrequencyBodyBodyGyroMagMean
* FrequencyBodyBodyGyroMagStd
* FrequencyBodyBodyGyroJerkMagMean
