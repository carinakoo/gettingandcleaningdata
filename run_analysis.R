run_analysis <- function() {

        # Read in features
        train_features <- read.table("UCI HAR Dataset/train/X_train.txt")
        test_features <- read.table("UCI HAR Dataset/test/X_test.txt")
        
        # Read in activity labels
        train_activitylabels <- read.table("UCI HAR Dataset/train/y_train.txt")
        test_activitylabels <- read.table("UCI HAR Dataset/test/y_test.txt")
        
        # Read in subjects
        train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
        test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

        # Merge the training and the test sets to create one data set
        combined_features <- rbind(train_features, test_features)
        combined_activitylabels <- rbind(train_activitylabels, test_activitylabels)
        combined_subjects <- rbind(train_subjects, test_subjects)
        completedata <- cbind(combined_features, combined_activitylabels, combined_subjects)
        
        # Appropriately labels the data set with descriptive variable names
        featurenames <- read.table("UCI HAR Dataset/features.txt", colClasses="character")
        names(completedata) <- c(featurenames$V2, "activity", "subject")
        
        # Use descriptive activity names to name the activities in the data set
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        completedata$activity <- tolower(activity_labels[completedata$activity,"V2"])
        
        # Extracts only the measurements on the mean and standard deviation for each measurement
        extractnames <- c(names(completedata)[grep("mean\\(\\)|std\\(\\)", names(completedata))], "activity", "subject")
        extractdata <- completedata[extractnames]
        
        # Creates a second, independent tidy data set with the average of each variable for each activity and each subject
        library(reshape2)
        melted <- melt(extractdata, id.vars = c("activity", "subject"))
        tidy <- dcast(melted, subject + activity ~ variable, mean)
        
        write.table(tidy, file = "tidy.txt", row.names=FALSE)
        tidy
}
