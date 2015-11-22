## Synopsis

R file **run_analysis.R** reads, transforms and writes particular SmartPhone data. The data is derived from tests carried out by 30 volunteers wearing Samsung smartphones while perofming certain activities like walking oe sitting. The data is divided in a set of TRAIN and a set of TEST data.

The goal of the script is to deliver a tidy data set that contains the averages per column, grouped by activity and subject.

# Prerequisites

The code expects the smartphone data to be placed in a particular directory structure: **[./data/project]**. Make sure the current working directory is set correctly in R of RStudio.

## Code

This section describes what the code does to reach its goal: deliver a tidy data set

###1) Read column names
This step reads the column names from **features.txt**. This file contains all column names for both train and test data. The column names ared tidied:
* comma's are replaced with hyphens
* all () brackets are removed
* finally, all hyphens are replaced with underscores

###2) Read activity names
This





