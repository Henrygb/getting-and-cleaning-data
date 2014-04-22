###############################################
## R script for tidy data peer review exercise
## in Coursera Getting and Cleaning Data course
##
## see README.md in repository for details
## Use run_analysis.R to avoid  
##     information on intermediate dataframes

##Read and examine files from working directory
getwd()

## R packages used later
library(plyr)
library(reshape2)

# Files used are:
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
dim(traindata) #[1] 7352  561
dim(testdata)  #[1] 2947  561
traindata[1:6,1:6]
testdata[1:6,1:6]

features <- read.table("features.txt")
dim(features) #[1] 561   2
head(features)

activitytrain <- read.table("y_train.txt")
activitytest <- read.table("y_test.txt")
dim(activitytrain) #[1] 7352    1
dim(activitytest)  #[1] 2947    1
head(activitytrain)
head(activitytest)
table(activitytrain)
table(activitytest)

activities <- read.table("activity_labels.txt")
dim(activities) #[1] 6 2
activities 

subjecttrain <- read.table("subject_train.txt")
subjecttest  <- read.table("subject_test.txt")
dim(subjecttrain) #[1] 7352    1
dim(subjecttest)  #[1] 2947    1
head(subjecttrain)
head(subjecttest)
table(subjecttrain)
table(subjecttest)

## features variable names lower case then remove (),- characters  
featuresclean <- tolower(features$V2)
featuresclean <- gsub("\\(","",featuresclean)
featuresclean <- gsub("\\)","",featuresclean)
featuresclean <- gsub(",","",featuresclean)
featuresclean <- gsub("-","",featuresclean)
featuresclean <- gsub("gravitymean-","gravitymean",featuresclean)
head(featuresclean)
tail(featuresclean)

## Remove those variables which do not have mean() or std() in variable name
## then apply featuresclean variable names to traindata and testdata
wanted <- which( (grepl("mean\\(\\)", features[,2]) |  
                  grepl("std\\(\\)", features[,2])   ) )
length(wanted)    #[1] 66
tidytraindata  <- traindata[,wanted]
tidytestdata   <- testdata[,wanted]
names(tidytraindata) <- featuresclean[wanted]
names(tidytestdata)  <- featuresclean[wanted]
dim(tidytraindata )  #[1] 7352   66
dim(tidytestdata)    #[1] 2947   66
tidytraindata[1:6,1:6]
tidytestdata[1:6,1:6]

## Add individuals and activities, giving activities lowercase words
tidytraindata <- cbind(subjecttrain, 
                       tolower(activities[activitytrain[,1],2]),
                       tidytraindata) 
tidytestdata  <- cbind(subjecttest, 
                       tolower(activities[activitytest[,1],2]), 
                       tidytestdata) 
names(tidytraindata)[c(1,2)] = c("individual","activity")
names(tidytestdata)[c(1,2)]  = c("individual","activity")
dim(tidytraindata)               #[1] 7352   68
dim(tidytestdata)                #[1] 2947   68
tidytraindata[1:6,1:6]
tidytestdata[1:6,1:6]

## Combine training and test data
tidymeansandstds <- rbind(tidytraindata, tidytestdata) 
dim(tidymeansandstds )           #[1] 10299    68
tidymeansandstds [1:6,1:6]

## Save tidymeansandstds 
write.table(tidymeansandstds, "tidymeansandstds.txt", row.names = FALSE) 

## Take means of means and standard deviations by individual and activity
##     using R packages plyr and reshape2
melted <- melt(tidymeansandstds, id=c("individual", "activity"))
head(melted)
dim(melted)                      #[1] 679734      4
meltedmeans <- ddply(melted, .(individual, activity, variable), 
      summarize,  value = mean(value))
head(meltedmeans)
dim(meltedmeans)                 #[1] 11880     4
tidymeansofmeansandstds <- dcast(meltedmeans, 
                                 individual + activity ~ variable) 
tidymeansofmeansandstds[1:6,1:6] 
dim(tidymeansofmeansandstds)     #[1] 180  68

## Save tidymeansofmeansandstds
write.table(tidymeansofmeansandstds, "tidymeansofmeansandstds.txt",
          row.names = FALSE) 

