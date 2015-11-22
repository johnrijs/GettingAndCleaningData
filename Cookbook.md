###Cookbook for importing, transforming and tidying Samsung smartphone data
This cookbook describes how data is imported, transformed and written back to a new file on disk after transformation.

The source data is collected from experiments carried out with a group of 30 volunteers where each person performed six activities wearing a smartphone. The goal of this process is to read the smartphone data, transform and tidy it and group it by activity and per volunteer (subject). All measurement are averaged per group (also mean). 

####Source files used
Below table lists all data tables used as input for this process.

| file              | description |
|-------------------|-------------|
|/data/project/features.txt | List of all features (column names)|
|/data/project/activity_labels.txt | Links the class labels with their activity name| 
|./data/project/train/train/X_train.txt | Training data|
|./data/project/train/train/Y_train.txt | Training data activity types| 
|./data/project/train/subject_train.txt | Train data subject (volunteer) id|
|./data/project/test/test/X_test.txt | Test data|
|./data/project/test/test/Y_test.txt | Test data activity types|
|./data/project/test/subject_test.txt | Test data subject (volunteer) id|

####Variables (measurements) imported
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Prefix 't' to denote time.'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals and are used in this process are: 
- mean(): Mean value
- std(): Standard deviation

All other variables are discarded.

####Transformation process
The transformation process is split into a number of steps:

1. Import column names from **/data/project/features.txt**. This file contains all column names for both train and test data. The column names ared tidied: comma's are replaced with hyphens; all () brackets are removed; all hyphens are replaced with underscores. The second part of this step imports the activity names from **/data/project/activity_labels.txt** associated with the activities performed by the volunteers.
2. Import train data from **./data/project/train/X_train.txt** and test data from **./data/project/test/X_test.txt**. The column names imported in step 1 will be used as new column names for the imported train and test data.
3. Import train and test activity types and subject id's from :
* train data
  - ./data/project/train/Y_train.txt (activity types)
  - ./data/project/train/subject_train.txt (subject id's)
* test data
  - ./data/project/test/Y_test.txt (activity types)
  - ./data/project/test/subject_test.txt (subject id's)
4. This step concatenates the columns of data imported in steps 2 and 3. This will add the activity type and subject id to the measurement data.
5. This step concatenates the rows from step 4 into one big file (still in memory).
6. Create a new data frame that contains the activity type, subject id and all measurement columns that have mean or std data. For this purpose the `grepl` function is used.
7. Groups the data by activity type and subject id by using the `aggregate` function. The result is merged with the activity names from step one to convert the activity types into their respective names. The resulting tidy data is written to disk into file: **./data/project/tidy_data.txt**

####Tidy data variables
The tidy data file contains 180 observations of 7 variables. For every volunteer (30 in total), 6 activity types are stored per measurement (5 in total). 

Below table lists the variables stored in the tidy data file.

|variable|type|description|value|
|--------|----|-----------|------|
|activity | factor of 6 levels | type of activity measured | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|
|subject_id | integer | Id of the volunteer involved | Ranges from 1-30 |
|tBodyAcc_mean_X | numeric | Body linear acceleration in direction X | mean measurement|
|tBodyAcc_mean_Y | numeric | Body linear acceleration in direction Y | mean measurement|
|tBodyAcc_mean_Z | numeric| Body linear acceleration in direction Z | mean measurement|
|tBodyAcc_std_X | numeric | Body linear acceleration in direction X | standard deviation measurement|
|tBodyAcc_std_Y | numeric | Body linear acceleration in direction Y | standard deviation measurement|





