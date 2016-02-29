library(dplyr)
dataPath <- "UCI HAR Dataset"

# get training data
trainData <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainSubject <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainActivity <- read.table(file.path(dataPath, "train", "y_train.txt"))
# Make data a data frame table for ease of printing
trainData <- tbl_df(trainData)

# get test data 
testData <- read.table(file.path(dataPath, "test", "X_test.txt"))
testSubject <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testActivity <- read.table(file.path(dataPath, "test", "y_test.txt"))
# Make data a data frame table for ease of printing
testData <- tbl_df(testData)

# Get a vector for the columns for the variables holding the 
# mean and standard deviation for each measurement.
meanstdVariables <- grep(("mean\\(|std"), features$V2)
meanstdVariableNames <- grep(("mean\\(|std"), features$V2, value = TRUE)

# In each data set, select only the variables holding mean and standard deviation 
trainDataMeanStd <- select(trainData, meanstdVariables)
testDataMeanStd <- select(testData, meanstdVariables)

# Label both data sets with the same descriptive variable names.
colnames(trainDataMeanStd) <- meanstdVariableNames
colnames(testDataMeanStd) <- meanstdVariableNames

# Add subject and activity variables to training data by cbind
colnames(trainSubject) <- "subject"
colnames(trainActivity) <- "activity"
trainDataBound <- bind_cols(trainSubject, trainActivity, trainDataMeanStd)

# Add subject and activity variables to test data by cbind
colnames(testSubject) <- "subject"
colnames(testActivity) <- "activity"
testDataBound <- bind_cols(testSubject, testActivity, testDataMeanStd)

# Merge the training and the test sets to create one data set.
allDataBound <- bind_rows(trainDataBound, testDataBound)

# Get activity labels and change to lower case and add descriptive names
activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
activityLabels$V2 <- tolower((activityLabels$V2))
colnames(activityLabels) <- c("activity", "activityType")

# Merge descriptive activity names with the data
allDataBound <- merge(activityLabels, allDataBound)

# Drop the activity variable to leave the description only

allDataBound <- select(allDataBound, -activity)

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

allDataGrouped <- group_by(allDataBound, subject, activityType)
averageSubjectActivity <- summarise_each(allDataGrouped, funs(mean))

# Write out the table to file in the working directory
write.table(averageSubjectActivity, file = "week4ProjectOutput.txt")