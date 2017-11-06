#1

# Reading datasets
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") 
View(x_test)
dim(x_test)

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
View(y_test)
dim(y_test)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
View(subject_test)
dim(subject_test)

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
View(x_train)
dim(x_train)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") 
View(y_train)
dim(y_train)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
View(subject_train)
dim(subject_train)

# Merging training and test data sets to create combined data sets 
y_tt <- rbind(y_train,y_test)
x_tt <- rbind(x_train,x_test)
subject_tt <- rbind(subject_train,subject_test)
all_data <- cbind(x_tt,y_tt,subject_tt)

# Viewing final merged dataset
View(all_data)


#2.
# Read the features table
features <- read.table("./UCI HAR Dataset/features.txt") 
View(features)
dim(features)

# The first column of features table corresponds to the column positions of x_tt (combined training and test datasets for x)

# Find all features with mean and standard deviation
meanstdfeatures <- features[grepl("mean\\(\\)|std\\(\\)",features$V2),]
View(meanstdfeatures)

# Map entries with mean and standard deviation to the main x_tt table (which is the rbind between test and train datasets)
# Use the first column of meanstdfeatures to match the columns numbers of x_tt
x_tt_meanstd <- x_tt[,meanstdfeatures[,1]]

# update the column names to be descriptive too
colnames(x_tt_meanstd) <- meanstdfeatures[,2]

View(x_tt_meanstd)

# Bind this subset with named columns for x, with y and subject
all_data <- cbind(x_tt_meanstd,y_tt,subject_tt)
View(all_data)
# Now the x part of the data set is named properly

#3
# Rename Subject column name so that activity column has a unique column name and can be merged with the activity table
dim(all_data)
# subject is on the 68th column
colnames(all_data)[68] <- "Subject"

# Reading the activity labels file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
View(activity_labels)

# Merging with activity labels so that the activity column has descriptive names 
data_with_activity <- merge(all_data, activity_labels, by.x = "V1", by.y = "V1", sort = FALSE)
View(data_with_activity)

# Now that we have a descriptive activity column from the merge, we can get rid of the V1 column
# V1 is the non descriptive version of V2
all_data <-data_with_activity[,2:69]
View(all_data)

#4
# Using the features definition to rename the column names in x
# Note that I'm using the subset of columns which have mean and standard deviation - this was calculated in step 2.
colnames(all_data) <- meanstdfeatures[,2]

# Giving descriptive name for subject Column
colnames(all_data)[67] <- "Subject"

# Giving descriptive name for Activity Column
colnames(all_data)[68] <- "ActivityName"
View(all_data)


#5
# use ddplyr to split the dataframe by ActivityName and Subject
# and calculate column means for remaining columns
library(plyr)

averages_data <- ddply(all_data, .(ActivityName,Subject), function(x) colMeans(x[, 1:66]))

View(averages_data)

write.table(averages_data, "./UCI HAR Dataset/tidydata.txt", sep="\t", row.names = FALSE, col.names = TRUE)
etc <- read.table("./UCI HAR Dataset/tidydata.txt")
View(etc)
