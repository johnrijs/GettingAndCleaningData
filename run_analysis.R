# read file that contains column names for train and test data
print('1. Read feature and activity names')
col_names <- read.table('./data/project/features.txt', sep='', header = FALSE)

# tidy up column names:
# 1) replace comma with hyphen
# 2) remove brackets
# 3) replace all hyphens with underscores
col_names[,2] <- gsub(',', '-', col_names[,2])
col_names[,2] <- gsub('[()]', '', col_names[,2])
col_names[,2] <- gsub('-', '_', col_names[,2])

# Read activity labels
activity <- read.table('./data/project/activity_labels.txt', sep='', header = FALSE)
names(activity)[1:2] <- c('activity_type', 'activity_name')


# read train and test data
print('2. Read TRAIN and TEST data')
raw_train <- read.table('./data/project/train/X_train.txt', sep='', header = FALSE)
raw_test  <- read.table('./data/project/test/X_test.txt', sep='', header = FALSE)

# change column names in raw_x_train and raw_x_test by using column 2 from col_names
colnames(raw_train) <- c(col_names[,2])
colnames(raw_test)  <- c(col_names[,2])


# read file that contains activity type per row of raw_x_train and raw_x_test data
print('3. Read TRAIN and TEST activity types')
activity_train <- read.table('./data/project/train/Y_train.txt', sep='', header = FALSE)
activity_test  <- read.table('./data/project/test/Y_test.txt', sep='', header = FALSE)

# read file that contains subject type per row of raw_x_train and raw_x_test data
subject_train <- read.table('./data/project/train/subject_train.txt', sep='', header = FALSE)
subject_test  <- read.table('./data/project/test/subject_test.txt', sep='', header = FALSE)

# name columns in activity and subject data.frames
names(subject_train)[1]  <- 'subject_id'
names(activity_train)[1] <- 'activity_type'
names(subject_test)[1]   <- 'subject_id'
names(activity_test)[1]  <- 'activity_type'


# bind columns of activity_types, subjects with TRAIN and TEST data
print('4. Bind columns of TRAIN raw, activity and subject data')
train_data <- cbind(activity_train, subject_train, raw_train)
# bind columns of activity_types, subjects and test data
test_data <- cbind(activity_test, subject_test, raw_test)


# bind raws of train and test data to create one data.frame
print('5. Bind rows of TRAIN and TEST data')
raw_data <- rbind(train_data, test_data)


# Via grep, select those columns that have mean, std or type in the name based on names(raw_data)
print('6. Create intermediate data set with only mean and std columns')
tidy_raw <- raw_data[grepl('mean|std|activity_type|subject_id', names(raw_data))]


# take mean of arbitrary number of columns (3:20) for every group of activity_type/subject_id
print('7. Group data en write results to disk')
tidy_data<- aggregate(tidy_raw[, 3:20], df[, 1:2], FUN = mean)
# replace df_group$activity_type with activity$activity_name and merge data; [-1] means activity_type column is removed from result
tidy_data <- merge(activity, tidy_data, by.x = 'activity_type', by.y = 'activity_type', all = TRUE)[-1]
write.table(tidy_data, file = './data/project/tidy_data.txt', row.names = FALSE, sep = ',')


