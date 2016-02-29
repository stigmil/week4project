# Getting and Cleaning Data - Week 4 Project
This codebook describes the data in the file "week4ProjectOutput.txt"

The data in the file is intended to be "tidy" in line with the principles set out by
Hadley Wickham in the paper "Tidy Data" [published in the Journal of Statistical Software](https://www.jstatsoft.org/article/view/v059i10).

## Source and measurements
The dataset was downloaded from URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source data was originally published in this paper:
_Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

The README file published with the source data explains how the measurements were gathered:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Why the dataset is tidy 
The data comprises a table of 180 observations of 68 variables. Each observation comprises
a variable showing a code for a single experimental subject and a variable describing a 
single experimental activity, during which measurements were made for the remaining
66 variables. In this dataset, each of the 66 measurements in each observation is 
is the mean of the individual observations of the corresponding variable in the source 
data for observed subject and activity. 

This layout of data fulfils the criterion for tidy data that each observation
forms a row of the dataset - even though in this case the observation is a mean of
a number of individual measurements. It also fulfils the criterion for tidy data that 
each variable forms a column of the dataset: the columns show the subject, the experimental 
activity and 66 individual measured variables. 

The 66 measured variables each represent one type of motion data recorded from the 
accelerometer and gyroscope of a smartphone worn by the experimental subject while carrying
out an experimental activity. This fulfils the criterion for tidy data that each type of
observational unit forms a table.

## Data Processing
The raw published data is divided into separate sets of test (2947 observations) and training 
(7352 observations) data. The raw data in each set included observations of 561 variables. 
For this analysis, only the measurements on the mean and standard deviation were extracted 
from the raw data for each dataset. This reduced the number of variables to 66. The mean 
and standard deviation measurements were identified from the variable names (described as 
"features" in the published data). Mean measurements were identified by the presence of 
the string "mean()" in the variable name. Standard deviation measurements were identified
by the presence of the string "std" in the variable name. A number of variables recorded
the mean frequency of some measured parameters, indicated by the string "meanFreq" in the 
variable name. These variables were excluded from the set for analysis as the mean
measured values of those variables were included. 

For this analysis, the test and training sets were combined into a single dataset, 
initially of 66 variables and 10299 observations.

The dplyr summarise() function was used to calculate the mean of each of the 66 
measurements for each experimental subject and activityType.

## Description of the variables
### subject
An integer in the range 1:30 that represents an individual anonymous experimental subject. 
For the test and training datasets, the observations for all subjects were stored in one
file and the subject code in a separate file in the same sequence as the measurements. 
In the analysis, the subject code for each observation was matched to the corresponding 
observation. 

### activityType
A factor with six levels, describing the six different activities carried out by 
experimental subjects during measurements. The six activities are:
- walking
- walking\_upstairs
- walking\_downstairs
- sitting
- standing
- laying

### 66 remaining variables
The names of the variables are shown below. The suffix -XYZ indicates that there are 
three individual measurements of the same parameter, being the X, Y and Z axis
measurements. Each of these variables is the mean of the corresponding measurements for 
the subject and activity.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

