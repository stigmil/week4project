# Getting and Cleaning Data - Week 4 Project

## System and software used
R code for this project was created using RStudio Version 0.99.489 running with 
R version 3.2.2 on Mac OS X 10.10.5

## Downloading and extracting the raw data
The raw data for this project was downloaded from URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The zipped file was unzipped using Stuffit Expander v15.0.4, creating a subdirectory
"UCI HAR Dataset" in the R working directory.

## The analysis script
The tidying of the raw data and production of the summarised data is carried out 
by a single script: run_analysis.R.  

## The output
The script run_analysis.R produces a tidy data set as described in the file CodeBook.md 
and writes the data set to a file **NAME HERE

## How to reproduce the analysis
To reproduce the analysis: 
 1. Download and unzip the raw data as described above
 2. Make sure that the unzipped data is located in a directory called "UCI HAR Dataset", which is a subdirectory of the R working directory.
 3. In most operating systems, the capitalisation of the subdirectory name must be exactly as written.
 4. Make sure the script "run\_analysis.R" is in the R working directory
 5. Run the script "run_analysis.R"
