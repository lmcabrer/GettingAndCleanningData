#This is the scrip required for the project.
#It outputs two datasets "data" and "dataSummarised". 
##################
# "data" containes the merged observations of the train and test for 
# the varialbles that contained the strings "mean" and "std" in their original names
# The new variable names were modified to make them mor human readable.
###############
# "dataSummarised" containes the average by subject and activity of the data in "data".


#Checking if we have the necesary packages and intalling them otherwise
if( sum(installed.packages()[,"Package"]=="dplyr") == 0 )
{
    install.packages("dplyr")
}

library(dplyr)


#This script assumes that the working directory 
#contains the folders /test and /train with the necessary files with the following names
#If the files are not in the working directory, please include the correct path for each file below
fileVariableNames<- "features.txt"
fileObsTest<- "./test/X_test.txt"
fileActTest<- "./test/Y_test.txt"
fileSubTest<- "./test/subject_test.txt"
fileObsTrain<-"./train/X_train.txt"
fileActTrain<- "./train/Y_train.txt"
fileSubTrain<-"./train/subject_train.txt"



#Transform the number of the activity into a meaningful name
translate <- function(x) {
    answer<-c(length(x))
    for (n in 1:length(x)) {
        if (x[n] == 1){
            answer[n]<- "WALKING"
        } else if (x[n]== 2){
            answer[n]<- "WALKING_UPSTAIRS"
        } else if (x[n]== 3){
            answer[n]<- "WALKING_DOWNSTAIRS"
        } else if (x[n]== 4){
            answer[n]<- "SITTING"  
        } else if (x[n]== 5){
            answer[n]<- "STANDING"
        } else if (x[n]==6){
            answer[n]<- "LAYING"
        } else { answer[n]<- NA }
    }
    answer
}



#Gets the names of the variables from the file and 
#Cleaning the names to be able manipulate them later. 
#For this we need to Take out non-valid characters
# and deal with repeated names in the file.
getNames <- function(fileName) {
    names<- read.table(fileName, colClasses = "character")
    names<-gsub("-","",names$V2)
    names<-gsub("\\(","",names)
    names<-gsub("\\)","",names)
    names<-sub("mean","Mean",names)
    names<-sub("std","Std",names)
    names<-sub("^t","Time",names)
    names<-sub("^f","Frequency",names)
    names<-sub("Acc","Acceleration",names)
    #There are repeated names in the file, with this we make them unique
    #After selecting the ones we are interested in we clean the unnecessary numbers
    names<- paste(names, 1:length(names),sep ="") 
    names
}

readData<- function(Xfile,Yfile,subFile) {
    #Reads data and selects variables
    x<- read.table(Xfile)
    y<- read.table(Yfile)
    subject <- read.table(subFile)
    
    #Selecting the variables that contain mean and standard deviations.
    names(x)<- names
    dataset<-tbl_df(x)
    dataset<-select(dataset,matches(".Mean.|.Std."))
    dataset<-select(dataset,-contains("MeanFreq"))
    dataset<-select(dataset,-contains("angle"))
    
    #Adding the activities and the subject identifier
    dataset<-mutate(dataset, Activity = y$V1)
    dataset<-mutate(dataset, Activity = translate(Activity))
    dataset<-mutate(dataset, Subject = subject$V1)
    dataset<- select(dataset, Subject, Activity, TimeBodyAccelerationMeanX1:FrequencyBodyBodyGyroJerkMagMean542)
    dataset
}

#Merges, orders and makes the last cleaning of the data.
mergeData<- function(test,train){
    finalData<-rbind(train,test)
    finalData<- arrange(finalData,Subject)
    #Cleanin the numers added to the names
    names(finalData)<-gsub("[0-9]","",names(finalData))
    finalData
}

#Returns the summarised dataset required in item 5, from the dataset of item 4.
getAverageBySubjectActivity <- function(data) {
    groupedData<- group_by(data, Subject , Activity)
    newData<- summarise_each(groupedData, funs(mean))
    names(newData)[3:67]<- paste("Average",names(newData)[3:67],sep=".")
    newData
}


########
#Here starts the main script
names<- getNames(fileVariableNames)

test<- readData(fileObsTest,fileActTest,fileSubTest)

train<- readData(fileObsTrain,fileActTrain,fileSubTrain)

#First dataset required in item 4.
data<- mergeData(test,train)

#Second dataset required in item 5.
dataSummarised<-getAverageBySubjectActivity(data)
####
# End of the main script


#If you want also to generate the txt file submitted in the first part of the project 
#uncommnent the following line
# write.table(dataSummarised, file="Summary.txt",row.name=FALSE)


#Dealocating unnecessary variables
rm(names)
rm(test)
rm(train)
rm(fileVariableNames)
rm(fileObsTest)
rm(fileActTest)
rm(fileSubTest)
rm(fileObsTrain)
rm(fileActTrain)
rm(fileSubTrain)
rm(translate)
rm(getNames)
rm(readData)
rm(mergeData)
rm(getAverageBySubjectActivity)


