#Load all data into separate variables
trainX = read.table("UCI HAR Dataset/train/X_train.txt")
trainY = read.table("UCI HAR Dataset/train/y_train.txt")
trainSub = read.table("UCI HAR Dataset/train/subject_train.txt")
trainBAX = read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
trainBAY = read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
trainBAZ = read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
trainBGX = read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
trainBGY = read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
trainBGZ = read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
trainTAX = read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
trainTAY = read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
trainTAZ = read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

#Assign activity names to labels
labeledTrainY = trainY 
labeledTrainY[trainY==1] = "WALKING"
labeledTrainY[trainY==2] = "WALKING_UPSTAIRS"
labeledTrainY[trainY==3] = "WALKING_DOWNSTAIRS"
labeledTrainY[trainY==4] = "SITTING"
labeledTrainY[trainY==5] = "STANDING"
labeledTrainY[trainY==6] = "LAYING"

#Assign labels for each field on variables
names(trainX) = paste("X",1:dim(trainX)[2],sep="_")
names(trainY) = c("activity_id")
names(labeledTrainY) = c("activity_name")
names(trainSub) = c("subject_id")
names(trainBAY) = paste("body_acc_y",1:dim(trainBAY)[2],sep="_")
names(trainBAX) = paste("body_acc_x",1:dim(trainBAX)[2],sep="_")
names(trainBAZ) = paste("body_acc_z",1:dim(trainBAZ)[2],sep="_")
names(trainBGX) = paste("body_gyro_x",1:dim(trainBGX)[2],sep="_")
names(trainBGY) = paste("body_gyro_y",1:dim(trainBGY)[2],sep="_")
names(trainBGZ) = paste("body_gyro_z",1:dim(trainBGZ)[2],sep="_")
names(trainTAX) = paste("total_acc_x",1:dim(trainTAX)[2],sep="_")
names(trainTAY) = paste("total_acc_y",1:dim(trainTAY)[2],sep="_")
names(trainTAZ) = paste("total_acc_z",1:dim(trainTAZ)[2],sep="_")

#merge variables into values only and fullDB with the label at the end for machine learning
trainValuesDB = cbind(trainBAX,trainBAY,trainBAZ,trainBGX,trainBGY,trainBGZ,trainTAX,trainTAY,trainTAZ,trainX)
trainFullDB = cbind(trainSub,trainBAX,trainBAY,trainBAZ,trainBGX,trainBGY,trainBGZ,trainTAX,trainTAY,trainTAZ,trainX,trainY)

#mean and standard deviaton for the non labels variables
trainDB_mean = colMeans(trainValuesDB)
trainDB_sd = apply(trainValuesDB, 2, sd)

#creating one mean and sd dataset for each activity
trainWalking_mean = trainDB_mean = colMeans(trainValuesDB[trainY==1,])
trainWalking_sd = apply(trainValuesDB[trainY==1,], 2, sd)
trainWalkingUp_mean = trainDB_mean = colMeans(trainValuesDB[trainY==2,])
trainWalkingUp_sd = apply(trainValuesDB[trainY==2,], 2, sd)
trainWalkingDown_mean = trainDB_mean = colMeans(trainValuesDB[trainY==3,])
trainWalkingDown_sd = apply(trainValuesDB[trainY==3,], 2, sd)
trainSitting_mean = trainDB_mean = colMeans(trainValuesDB[trainY==4,])
trainSitting_sd = apply(trainValuesDB[trainY==4,], 2, sd)
trainStanding_mean = trainDB_mean = colMeans(trainValuesDB[trainY==5,])
trainStanding_sd = apply(trainValuesDB[trainY==5,], 2, sd)
trainLaying_mean = trainDB_mean = colMeans(trainValuesDB[trainY==6,])
trainLaying_sd = apply(trainValuesDB[trainY==6,], 2, sd)

trainTidyData = rbind(trainWalking_mean, trainWalking_sd, trainWalkingUp_mean, trainWalkingUp_sd, trainWalkingDown_mean, trainWalkingDown_sd, trainSitting_mean, trainSitting_sd, trainStanding_mean, trainStanding_sd, trainLaying_mean, trainLaying_sd)


#Load all data into separate variables
testX = read.table("UCI HAR Dataset/test/X_test.txt")
testY = read.table("UCI HAR Dataset/test/y_test.txt")
testSub = read.table("UCI HAR Dataset/test/subject_test.txt")
testBAX = read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
testBAY = read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
testBAZ = read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
testBGX = read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
testBGY = read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
testBGZ = read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
testTAX = read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
testTAY = read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
testTAZ = read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

#Assign activity names to labels
labeledtestY = testY 
labeledtestY[testY==1] = "WALKING"
labeledtestY[testY==2] = "WALKING_UPSTAIRS"
labeledtestY[testY==3] = "WALKING_DOWNSTAIRS"
labeledtestY[testY==4] = "SITTING"
labeledtestY[testY==5] = "STANDING"
labeledtestY[testY==6] = "LAYING"

#Assign labels for each field on variables
names(testX) = paste("X",1:dim(testX)[2],sep="_")
names(testY) = c("activity_id")
names(labeledtestY) = c("activity_name")
names(testSub) = c("subject_id")
names(testBAY) = paste("body_acc_y",1:dim(testBAY)[2],sep="_")
names(testBAX) = paste("body_acc_x",1:dim(testBAX)[2],sep="_")
names(testBAZ) = paste("body_acc_z",1:dim(testBAZ)[2],sep="_")
names(testBGX) = paste("body_gyro_x",1:dim(testBGX)[2],sep="_")
names(testBGY) = paste("body_gyro_y",1:dim(testBGY)[2],sep="_")
names(testBGZ) = paste("body_gyro_z",1:dim(testBGZ)[2],sep="_")
names(testTAX) = paste("total_acc_x",1:dim(testTAX)[2],sep="_")
names(testTAY) = paste("total_acc_y",1:dim(testTAY)[2],sep="_")
names(testTAZ) = paste("total_acc_z",1:dim(testTAZ)[2],sep="_")

#merge variables into values only and fullDB with the label at the end for machine learning
testValuesDB = cbind(testBAX,testBAY,testBAZ,testBGX,testBGY,testBGZ,testTAX,testTAY,testTAZ,testX)
testFullDB = cbind(testSub,testBAX,testBAY,testBAZ,testBGX,testBGY,testBGZ,testTAX,testTAY,testTAZ,testX,testY)

#mean and standard deviaton for the non labels variables
testDB_mean = colMeans(testValuesDB)
testDB_sd = apply(testValuesDB, 2, sd)

#creating one mean and sd dataset for each activity
testWalking_mean = testDB_mean = colMeans(testValuesDB[testY==1,])
testWalking_sd = apply(testValuesDB[testY==1,], 2, sd)
testWalkingUp_mean = testDB_mean = colMeans(testValuesDB[testY==2,])
testWalkingUp_sd = apply(testValuesDB[testY==2,], 2, sd)
testWalkingDown_mean = testDB_mean = colMeans(testValuesDB[testY==3,])
testWalkingDown_sd = apply(testValuesDB[testY==3,], 2, sd)
testSitting_mean = testDB_mean = colMeans(testValuesDB[testY==4,])
testSitting_sd = apply(testValuesDB[testY==4,], 2, sd)
testStanding_mean = testDB_mean = colMeans(testValuesDB[testY==5,])
testStanding_sd = apply(testValuesDB[testY==5,], 2, sd)
testLaying_mean = testDB_mean = colMeans(testValuesDB[testY==6,])
testLaying_sd = apply(testValuesDB[testY==6,], 2, sd)

testTidyData = rbind(testWalking_mean, testWalking_sd, testWalkingUp_mean, testWalkingUp_sd, testWalkingDown_mean, testWalkingDown_sd, testSitting_mean, testSitting_sd, testStanding_mean, testStanding_sd, testLaying_mean, testLaying_sd)

#Fuse training and test sets into one
fusedValuesDB = rbind(testValuesDB,trainValuesDB)
fusedFullDB = rbind(testFullDB, trainFullDB)
fusedTidyData = rbind(trainTidyData,testTidyData)

#saving the tidy data for the excersise answer
write.table(fusedTidyData, file="fusedTidyData.txt", row.names=FALSE)