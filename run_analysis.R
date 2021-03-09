#loading features and activity data
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#loading train data
train <- read.table("train/X_train.txt") 
colnames(train) <- features$V2 
y_train <- read.table("train/y_train.txt") 
train$activity <- y_train$V1
subject_train <- read.table("train/subject_train.txt")
train$subject <- factor(subject_train$V1)


#loading test data
test <- read.table("test/X_test.txt")
colnames(test) <- features$V2
y_test <- read.table("test/y_test.txt") 
test$activity <- y_test$V1
subject_test <- read.table("test/subject_test.txt")
test$subject <- factor(subject_test$V1)

#merging train and test sets 
dataset <- rbind(test, train) 

#filtering column names 
column.names <- colnames(dataset)
#get only columns for standard deviation and mean values, also saves activity and subject values 
column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
dataset.filtered <- dataset[, column.names.filtered] 

#adding descriptive values for activity labels 
dataset.filtered$activitylabel <- factor(dataset.filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#creating a tidy dataset with mean values for each subject and activity
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)
dataset.melt <-melt(dataset.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)

#creating a tidy dataset file  
write.table(dataset.tidy, file = "tidydataset.txt", row.names = FALSE)