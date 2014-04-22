###############################################
## R script for tidy data peer review exercise
## in Coursera Getting and Cleaning Data course
##
## see README.md in repository for details
## Use run_analysis_verbose.R for 
##     information on intermediate dataframes

## R packages used later
library(plyr)
library(reshape2)

## Files used as input are:
#
#   X_train.txt
#   X_test.txt
#   features.txt
#   y_train.txt
#   y_test.txt
#   activity_labels.txt
#   subject_train.txt
#   subject_test.txt

traindata <- read.table("X_train.txt")
testdata <- read.table("X_test.txt")
features <- read.table("features.txt")
activitytrain <- read.table("y_train.txt")
activitytest <- read.table("y_test.txt")
activities <- read.table("activity_labels.txt")
subjecttrain <- read.table("subject_train.txt")
subjecttest  <- read.table("subject_test.txt")

## features variable names lower case then remove (),- characters  
featuresclean <- tolower(features$V2)
featuresclean <- gsub("\\(","",featuresclean)
featuresclean <- gsub("\\)","",featuresclean)
featuresclean <- gsub(",","",featuresclean)
featuresclean <- gsub("-","",featuresclean)
featuresclean <- gsub("gravitymean-","gravitymean",featuresclean)

## Remove those variables which do not have mean() or std() in variable name
## then apply featuresclean variable names to traindata and testdata
wanted <- which( (grepl("mean\\(\\)", features[,2]) |  
                  grepl("std\\(\\)", features[,2])   ) )
tidytraindata  <- traindata[,wanted]
tidytestdata   <- testdata[,wanted]
names(tidytraindata) <- featuresclean[wanted]
names(tidytestdata)  <- featuresclean[wanted]

## Add individuals and activities, giving activities lowercase words
tidytraindata <- cbind(subjecttrain, 
                       tolower(activities[activitytrain[,1],2]),
                       tidytraindata) 
tidytestdata  <- cbind(subjecttest, 
                       tolower(activities[activitytest[,1],2]), 
                       tidytestdata) 
names(tidytraindata)[c(1,2)] = c("individual","activity")
names(tidytestdata)[c(1,2)]  = c("individual","activity")

## Combine training and test data
tidymeansandstds <- rbind(tidytraindata, tidytestdata) 

## Save tidymeansandstds 
write.table(tidymeansandstds, "tidymeansandstds.txt", row.names = FALSE) 

## Take means of means and standard deviations by individual and activity
##     using R packages plyr and reshape2
melted <- melt(tidymeansandstds, id=c("individual", "activity"))
meltedmeans <- ddply(melted, .(individual, activity, variable), 
      summarize,  value = mean(value))
tidymeansofmeansandstds <- dcast(meltedmeans, 
                                 individual + activity ~ variable) 

## Save tidymeansofmeansandstds
write.table(tidymeansofmeansandstds, "tidymeansofmeansandstds.txt",
          row.names = FALSE) 

