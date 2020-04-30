Codebook Summary: 
1) Datasets description
2) Transformations details

Datasets details

  wearable_data
  
    Description:
    
      This data set contains the mean and standard deviation measurements of the different variables derived from accelerometer
      and gyroscope sensors. Additionnally, there are two variables corresponding to activity that the subject was conducting at
      each observation and the ID of the subject. Each observation corresponds to the time window on which the mean and standard 
      deviation were measured. There is a total of 10299 observations.
      
    Variable list:
    
      tBodyAcc-mean()-X
      tBodyAcc-mean()-Y
      tBodyAcc-mean()-Z
      tBodyAcc-std()-X
      tBodyAcc-std()-Y
      tBodyAcc-std()-Z
      tGravityAcc-mean()-X
      tGravityAcc-mean()-Y
      tGravityAcc-mean()-Z
      tGravityAcc-std()-X
      tGravityAcc-std()-Y
      tGravityAcc-std()-Z
      tBodyAccJerk-mean()-X
      tBodyAccJerk-mean()-Y
      tBodyAccJerk-mean()-Z
      tBodyAccJerk-std()-X
      tBodyAccJerk-std()-Y
      tBodyAccJerk-std()-Z
      tBodyGyro-mean()-X
      tBodyGyro-mean()-Y
      tBodyGyro-mean()-Z
      tBodyGyro-std()-X
      tBodyGyro-std()-Y
      tBodyGyro-std()-Z
      tBodyGyroJerk-mean()-X
      tBodyGyroJerk-mean()-Y
      tBodyGyroJerk-mean()-Z
      tBodyGyroJerk-std()-X
      tBodyGyroJerk-std()-Y
      tBodyGyroJerk-std()-Z
      tBodyAccMag-mean()
      tBodyAccMag-std()
      tGravityAccMag-mean()
      tGravityAccMag-std()
      tBodyAccJerkMag-mean()
      tBodyAccJerkMag-std()
      tBodyGyroMag-mean()
      tBodyGyroMag-std()
      tBodyGyroJerkMag-mean()
      tBodyGyroJerkMag-std()
      fBodyAcc-mean()-X
      fBodyAcc-mean()-Y
      fBodyAcc-mean()-Z
      fBodyAcc-std()-X
      fBodyAcc-std()-Y
      fBodyAcc-std()-Z
      fBodyAccJerk-mean()-X
      fBodyAccJerk-mean()-Y
      fBodyAccJerk-mean()-Z
      fBodyAccJerk-std()-X
      fBodyAccJerk-std()-Y
      fBodyAccJerk-std()-Z
      fBodyGyro-mean()-X
      fBodyGyro-mean()-Y
      fBodyGyro-mean()-Z
      fBodyGyro-std()-X
      fBodyGyro-std()-Y
      fBodyGyro-std()-Z
      fBodyAccMag-mean()
      fBodyAccMag-std()
      fBodyBodyAccJerkMag-mean()
      fBodyBodyAccJerkMag-std()
      fBodyBodyGyroMag-mean()
      fBodyBodyGyroMag-std()
      fBodyBodyGyroJerkMag-mean()
      fBodyBodyGyroJerkMag-std()
      activity 
      subject
      
      The units of variables derived from acceleration signals (containing Acc in name) are in standard gravity units 'g'
      The units of variables derived from gyroscope signals (containing Gyro in name) are in radians/second.
      activity can take the following values: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
      subject is an integer between 1 and 30

avg_wearable_data
  
    Description:
    
      This data set contains the mean of all the variables of the wearable_data data set, by activity and subject. 
      It contains 30*6 (180) observations, one for each combination of a subject and an activity. Just like the wearable_data
      data set, it has 66 variables. 
      
    Variable list:
      activity 
      subject
      tBodyAcc-mean()-X
      tBodyAcc-mean()-Y
      tBodyAcc-mean()-Z
      tBodyAcc-std()-X
      tBodyAcc-std()-Y
      tBodyAcc-std()-Z
      tGravityAcc-mean()-X
      tGravityAcc-mean()-Y
      tGravityAcc-mean()-Z
      tGravityAcc-std()-X
      tGravityAcc-std()-Y
      tGravityAcc-std()-Z
      tBodyAccJerk-mean()-X
      tBodyAccJerk-mean()-Y
      tBodyAccJerk-mean()-Z
      tBodyAccJerk-std()-X
      tBodyAccJerk-std()-Y
      tBodyAccJerk-std()-Z
      tBodyGyro-mean()-X
      tBodyGyro-mean()-Y
      tBodyGyro-mean()-Z
      tBodyGyro-std()-X
      tBodyGyro-std()-Y
      tBodyGyro-std()-Z
      tBodyGyroJerk-mean()-X
      tBodyGyroJerk-mean()-Y
      tBodyGyroJerk-mean()-Z
      tBodyGyroJerk-std()-X
      tBodyGyroJerk-std()-Y
      tBodyGyroJerk-std()-Z
      tBodyAccMag-mean()
      tBodyAccMag-std()
      tGravityAccMag-mean()
      tGravityAccMag-std()
      tBodyAccJerkMag-mean()
      tBodyAccJerkMag-std()
      tBodyGyroMag-mean()
      tBodyGyroMag-std()
      tBodyGyroJerkMag-mean()
      tBodyGyroJerkMag-std()
      fBodyAcc-mean()-X
      fBodyAcc-mean()-Y
      fBodyAcc-mean()-Z
      fBodyAcc-std()-X
      fBodyAcc-std()-Y
      fBodyAcc-std()-Z
      fBodyAccJerk-mean()-X
      fBodyAccJerk-mean()-Y
      fBodyAccJerk-mean()-Z
      fBodyAccJerk-std()-X
      fBodyAccJerk-std()-Y
      fBodyAccJerk-std()-Z
      fBodyGyro-mean()-X
      fBodyGyro-mean()-Y
      fBodyGyro-mean()-Z
      fBodyGyro-std()-X
      fBodyGyro-std()-Y
      fBodyGyro-std()-Z
      fBodyAccMag-mean()
      fBodyAccMag-std()
      fBodyBodyAccJerkMag-mean()
      fBodyBodyAccJerkMag-std()
      fBodyBodyGyroMag-mean()
      fBodyBodyGyroMag-std()
      fBodyBodyGyroJerkMag-mean()
      fBodyBodyGyroJerkMag-std()


Transformation details (Please see codebook of UCI HAR Dataset for details about source data sets)
 
  Used source data sets:
    1) X_train, X_test containing all the measurements of interest
    2) Y_train, Y_test containing all labels for the measurements (ie the activity that was conducted for each observation)
    3) subject_train, subject_test containing the subject IDs for each obserbation.
    4) features, containing the name of all the features
    5) activity_labels, containing the label of each activity (stored as integers in Y datasets)
  
  To obtain wearable_data:
    1) Combine rows of train/test data sets for X, Y and subject using rbind()
    2) For Y, convert the integer corresponding to each activity to its name using activity_labels.txt and sapply()
    3) Select from X only the mean and std variables and rename using select() and the features data set (features.txt)
        This is done by using a regex expression to find all variable in the features data set that contain "mean()" or "std()"
    4) Rename X columns using the feature names in the feature data set (features.txt) and rename_all()
    5) Add two variables to X using mutate() : activity which contains Y values and subject which contains subject IDs
    6) Convert this to a data.table (dplyr) and store it in wearable_data. 
    
  To obtain avg_wearable_data:
    1) group wearable_data by activity and subject using group_by
    2) Summarize the grouped data.table with the mean function and sumarize_all()
