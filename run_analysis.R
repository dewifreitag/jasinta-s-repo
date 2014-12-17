# You should create one R script called run_analysis.R that does the following.
    features.train<-read.table("train/X_train.txt")
    activity.train<-read.table("train/y_train.txt")
    subject.train<-read.table("train/subject_train.txt")
    features.test<-read.table("test/X_test.txt")
    activity.test<-read.table("test/y_test.txt")
    subject.test<-read.table("test/subject_test.txt")

    names(activity.train)<-c("activity")
    names(activity.test)<-c("activity")
    names(subject.train)<-c("subject")
    names(subject.test)<-c("subject")
    features<-read.table("features.txt", colClasses="character")
    features.names<-features[,2]
    names(features.test)<-features.names
    names(features.train)<-features.names


# 1. Merges the training and the test sets to create one data set.
    library(dplyr)
    train<-mutate(subject.train, status="train")
    train<-cbind(train,activity.train,features.train)
    test<-mutate(subject.test, status="test")
    test<-cbind(test,activity.test,features.test)
    merged.data<-rbind(train,test)
    data<-tbl_df(merged.data)


# 2.Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
    not.duplicated<-!duplicated(names(merged.data))
    new.data<-merged.data[not.duplicated]
    
    extracted.data<-select(new.data, subject, status, activity, 
                           contains("mean()"),contains("std()"))


# 3. Uses descriptive activity names to name the activities in the data set
    labels<-read.table("activity_labels.txt", colClasses="character")
    label.names<-labels[,2]
    extracted.data$activity <- as.character(extracted.data$activity)
    for (i in 1:6) {
       extracted.data$activity[extracted.data$activity == as.character(i)] <-
           label.names[i]
    }
    extracted.data$activity <- as.factor(extracted.data$activity)


# 4. Appropriately labels the data set with descriptive variable names. 
    new.data<-select(extracted.data, subject, status, activity, contains("Mag"))
    new.names<-gsub(pattern="\\()", replacement="", x=names(new.data))
    new.names<-gsub("-", "", new.names)
    new.names<-tolower(new.names)
    names(new.data)<-new.names


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
    tidy.data<-with(new.data, aggregate(list(new.data[4:21]), 
                                        list(subject=new.data$subject, 
                                             activity=new.data$activity), mean))
    write.table(tidy.data, "tidy.txt", row.names=FALSE, quote=FALSE)

    
# Please upload the tidy data set created in step 5 of the instructions. 
# Please upload your data set as a txt file created with write.table() using 
# row.name=FALSE (do not cut and paste a dataset directly into the text box, 
# as this may cause errors saving your submission).