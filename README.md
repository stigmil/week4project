# Getting and Cleaning Data - Week 4 Project

## System and software used
R code for this project was created using RStudio Version 0.99.489 running with 
R version 3.2.2 on Mac OS X 10.10.5

## Downloading and extracting the raw data
The raw data for this project was downloaded from URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The zipped file was unzipped using Stuffit Expander v15.0.4, creating a subdirectory
"UCI HAR Dataset" in the R working directory. The download and unzip actions were 
carried out in the Mac OS X file system, not using RStudio or R.

## The analysis script
The tidying of the raw data and production of the summarised data is carried out 
by a single script: run_analysis.R.  

## The output
The script run_analysis.R produces a tidy data set as described in the file CodeBook.md 
and writes the data set to a file "week4ProjectOutput.txt" in the working directory

## How to reproduce the analysis
To reproduce the analysis: 
 1. Download and unzip the raw data as described above
 2. Make sure that the unzipped data is located in a directory called "UCI HAR Dataset", which is a subdirectory of the R working directory.
 3. In most operating systems, the capitalisation of the subdirectory name must be exactly as written.
 4. Make sure the script "run\_analysis.R" is in the R working directory
 5. Run the script "run_analysis.R"
 
## To read the output file back into R
 The analysis script writes the output file "week4ProjectOutput.txt" using the R
 function write.table(). The following code will read the output file back into R 
 as a data frame: `data <- df_tbl(read.table("week4ProjectOutput.txt", header = TRUE))`
This description is based on a recommendation made in [this blog.]
(https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) 
  