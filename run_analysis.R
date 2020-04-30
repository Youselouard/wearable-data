## checking for missing packages and installing them
if (!require("dplyr")) {
  install.packages("dplyr")
}
library(dplyr)


## download the data (if not there already), unzip if not already unzipped
if(!file.exists("wearable_data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                "wearable_data.zip")
  unzip("wearable_data.zip")
} else if (!file.exists("UCI HAR Dataset")) {
  unzip("wearable_data.zip")
}

## Reading all required data sets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merging train and test datasets
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
subject <- rbind(subject_train, subject_test)

rm(list=c("X_train","X_test","Y_train","Y_test","subject_train", "subject_test"))

## Transforming activity integers into their labels (Y)

Y$V1 <- sapply(Y$V1, function(elem){activity_labels[elem,2]})


## Selecting only mean and std variables and renaming them

  ##Getting indexes of desired features using a regex matching any feature containing mean() or std()
  findex <- grep("(mean\\(\\)|std\\(\\))", features$V2)
  
  ##Function that takes as input the column name for source data ("V1", "V2" etc.) and outputs the feature name
  feature_name <- function(elem, features) {
    features[as.numeric(sub("V", "", elem )),2]
  }
  
  ##Select only mean and std variables, then rename them using feature names from features.txt
  X_tidy <- X %>% select(findex) %>% rename_all(funs(feature_name(.,features)))
  

## Adding activity labels (Y dataset) and subject ID
wearable_data <- tbl_df(mutate(X_tidy, activity = Y$V1, subject = subject$V1))
rm(list=c("features","findex","X_tidy","Y","subject","X","activity_labels")) 

## Creating another data set with the average of all variables per activity and subject

avg_wearable_data <- wearable_data %>% group_by(activity, subject) %>% summarize_all(mean) 



