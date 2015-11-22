###Cookbook for importing, transforming and tidying Samsung smartphone data
This cookbook describes how data is imported, transformed and written back to disk.

The source data is collected from experiments carried out with a group of 30 volunteers where each person performed six activities wearing a smartphone. The goal of this process is to read the smartphone data, transform and tidy it and group it by activity and per volunteer (subject). All measurement are averaged per group (aka mean). 

####Source files used
Below table lists all tables used for this process.

| file              | description |
|-------------------|-------------|
|features_info.txt | Shows information about the variables used on the feature vector|
|features.txt | List of all features (column names)|
|activity_labels.txt | Links the class labels with their activity name| 
|train/X_train.txt | Training data|
|train/y_train.txt | Training data activity types| 
|subject_train.txt | Train data subject (volunteer) id|
|test/X_test.txt | Test data|
|test/y_test.txt | Test data activity types|
|subject_test.txt | Test data subject (volunteer) id|


