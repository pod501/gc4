## Instructions on Generating the Final Data Set

Download data from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Description Available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Read in Data
------------
Read the abbreviations in features.txt which will be used as column description for the actual data set in x_test.txt and x_train.txt.

Test data is read from final/test directory:
subject_test.txt
x_test.txt
y_test.txt

The subject_test data is a single column given the header 'Subject'.
The y_test data is single column given the header 'Activity'
The x_test is given the 561 columns read in from features.txt

Train data is read from final/train directory:
subject_train.txt
x_train.txt
y_train.txt

The subject_train data is a single column given the header 'Subject'.
The y_train data is single column given the header 'Activity'
The x_train is given the 561 columns read in from features.txt

Merge Data
-----------
Test data combined with cbind so all_test_data is the concatenation of:
subject_test.txt, x_test.txt, y_test.txt

Train data combined with cbind so all_train_data is the concatenation of:
subject_train.txt, x_train.txt, y_train.txt

Renaming Headers
----------------
The names command is applied to remove the leading t from the headers.

Aggregate Data
--------------
The Subject and Activity columns are grouped together using a groupby and the associated collated scores have the mean taken of them. This reduces the size of the dataset from some 10000 lines to 181.

The final document will have:
Subject Activity followed by the 561 column headers supplied in features.txt

