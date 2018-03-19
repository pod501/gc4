## Download files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Restore into c:\r\final
## Take test and train data and Merge into 1 data set.


# Read names of 561 columns to be used as headers throughout process:
features <-read.table("c:\\r\\final\\features.txt",header = FALSE)

# The 6 activities are given numeric values
activitys_labels <- read.table("c:\\r\\final\\activity_labels.txt", header = FALSE)

# x_test contains the readings
# subject_test contains the subject values
# y_test contains the activities
subject_test <- read.table("c:\\r\\final\\test\\subject_test.txt",header = FALSE)
x_test <- read.table("c:\\r\\final\\test\\x_test.txt",header = FALSE)
y_test <- read.table("c:\\r\\final\\test\\y_test.txt",header = FALSE)

# Label the Subject and Activity columns in preparation for merging
names(subject_test) <- ( 'Subject')
names(y_test) <- ( 'Activity')
names(x_test)<-features$V2

# x_train contains the readings
# subject_train contains the subject values
# y_train contains the activities
subject_train <- read.table("c:\\r\\final\\train\\subject_train.txt",header = FALSE)
x_train <- read.table("c:\\r\\final\\train\\x_train.txt",header = FALSE)
y_train <- read.table("c:\\r\\final\\train\\y_train.txt",header = FALSE)

names(subject_train) <- ( 'Subject')
names(y_train) <- ( 'Activity')
names(x_train)<-features$V2

## Merge the data sets.
## First merge test, then train, then merge both together
all_test_data = cbind(subject_test, x_test, y_test)
all_train_data = cbind(subject_train, x_train, y_train)
both_data_sets = rbind(all_test_data, all_train_data)

## Give meaningful header names, removing leading t for time.

names(both_data_sets) <- gsub("^t", "", names(both_data_sets))

aggdata <- aggregate(. ~Subject + Activity, both_data_sets, mean)
write.table(aggdata, "c:\\r\\aggdata.txt", row.name=FALSE)

