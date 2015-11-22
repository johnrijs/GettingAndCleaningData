###Cookbook for importing, transforming and tidying Samsung smartphone data
This cookbook describes how data is imported, transformed and written back to disk.

The source data is collected from experiments carried out with a group of 30 volunteers where each person performed six activities wearing a smartphone. The goal of this process is to read the smartphone data, transform and tidy it and group it by activity and per volunteer (subject). All measurement are averaged per group (aka mean). 

####Source files used
Below table lists all tables used for this process.

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

The set of variables that were estimated from these signals and used in this process are: 
- mean(): Mean value
- std(): Standard deviation



