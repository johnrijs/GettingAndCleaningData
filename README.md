### Synopsis

R file **run_analysis.R** reads, transforms and writes particular SmartPhone data. The data is derived from tests carried out by 30 volunteers wearing Samsung smartphones while perofming certain activities like walking oe sitting. The data is divided in a set of TRAIN and a set of TEST data.

The goal of the script is to deliver a tidy data set that contains the averages per column, grouped by activity and subject.

### Prerequisites

The code expects the smartphone data to be placed in a particular directory structure: **[./data/project]**. Make sure the current working directory is set correctly in R of RStudio.

### Code explanation

This section describes what the code does to reach its goal: deliver a tidy data set

#####1) Import column and activity names
This step imports the column names from **/data/project/features.txt**. This file contains all column names for both train and test data. The column names ared tidied:
* comma's are replaced with hyphens
* all () brackets are removed
* finally, all hyphens are replaced with underscores

The next step imports the activity names from **/data/project/activity_labels.txt** associated with the activities performed by the volunteers.

#####2) Import train and test data and change column names
This step imports train data from **./data/project/train/X_train.txt** and test data from **./data/project/test/X_test.txt**. The column names imported in step 1 will be used as new column names for the imported train and test data.

#####3) Import train and test activity types and subject id's
This step imports activity types and subject id's from these files:

* train data
  - ./data/project/train/Y_train.txt (activity types)
  - ./data/project/train/subject_train.txt (subject id's)
* test data
  - ./data/project/test/Y_test.txt (activity types)
  - ./data/project/test/subject_test.txt (subject id's)

#####4) Bind the column of activity types, subjects id's with either train and test data
This step concatenates the column of data imported in steps 2 and 3. This will add the activity type and subject id to the measurement data.

#####5) Bind the rows of train and test data
This step concatenates the rows from step 4 into one big file (still in memory)

#####6) Make a subset of the data leaving only the columns that contain mean or std (standard deviation) data
This step creates a new data frame that contains the activity type, subject id and all measurement columns that have mean or std data. For this purpose the `grepl` function is used.

#####7) Group the data by activity and subject and write result to disk
This step groups the data by activity type and subject id by using the `aggregate` function. The result is merged with the activit names from step one to convert the activity types into tjeir respective names.
The final step writes the tidy data set to disk: **./data/project/tidy_data.txt**

### Execution
Run the script as a whole.










