# Course Project
The repo contains the course project for the Coursera course [Getting and Cleaning Data][1] from Johns Hopkins University. 

The project includes R script "run_analysis.R", code book file "CodeBook.md", final output file "variable means by activities.txt", and "README.md" file.

The "Human Activity Recognition Using Smartphones Data Set" is used for this project. A full description is available at [the link][2] where the data was obtained. Here is the [download link][3] for the data used in this project.


## Goal
The goal of this project is to clean and manipulate the data set for future analysis. The detail process includes:

 * Merge the test and train data set 
 * Add readable variable names
 * Extract only the measurements with "mean" or "std" in the variable names
 * Add the activity labels with readable names
 * Create a tidy data set with the average of each variable for each activity and each subject

## R script
The project Adopt R to perform the analysis, and the detailed process is included in the code book. The R script also used the "plyr" R package.
To use the R script appropriately, users need to download and unpack the data set file, and then set the working directory of R to "UCI HAR Dataset" folder.

## Output
The output data set should be automatically written into a text file with the name "variable means by activities.txt" in the working directory.

[1]: https://www.coursera.org/course/getdata
[2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[3]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip