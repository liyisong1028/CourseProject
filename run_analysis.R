library(plyr)

## Read in the datasets
test<-read.table("./test/X_test.txt")
test.labels<-read.table("./test/y_test.txt")
train<-read.table("./train/X_train.txt")
train.labels<-read.table("./train/y_train.txt")
activity_labels<-read.table("./activity_labels.txt")
features<-read.table("./features.txt")

## Merge the test and train datasets
data<-rbind(test, train)
labels<-rbind(test.labels,train.labels)
rm(test)
rm(train)
rm(test.labels)
rm(train.labels)

## Replace the variable names with descriptive variable names
names(data)<-as.character(features[,2])
rm(features)

## Extracts only the measurements on the mean and standard deviation
index = c(grep("mean", names(data),ignore.case = T),
          grep("std", names(data),ignore.case = T))
data<-data[,index]
rm(index)

## Create mreplace function to replace vector values
## through a dictionary data frame
mreplace<-function(v, dic.df) {
        v<-as.character(v)
        dic.df[,1]<-as.character(dic.df[,1])
        dic.df[,2]<-as.character(dic.df[,2])
        for (i in 1:nrow(dic.df)) {
                v <- replace(v, which(v == dic.df[i,1]), dic.df[i,2])
        }
        v
}

## Replace the labels with descriptive activity names by using activity_labels 
## as a dictionary and merge the labels and merge the data and labels
labels[,1]<-mreplace(labels[,1],activity_labels)
data<-cbind(data,labels)
names(data)[ncol(data)]<-"activities"
rm(labels)
rm(activity_labels)

## Create new dataset contains the means for every variables that group by 
## activities
v.means<-ddply(data, .(activities), numcolwise(mean))

## Write the new dataset into a text file
write.table(v.means,"variable_means_by_activities.txt",row.name=FALSE)