# SVM modeling tutorial
# https://www.r-bloggers.com/the-5th-tribe-support-vector-machines-and-caret/

library(caret)
library(dplyr)
library(kernlab)
library(pROC)

data(iris)
trainIndex <- createDataPartition(iris$Species, p=0.8, list=FALSE)
trainData <- iris[trainIndex,]
testData <- iris[-trainIndex,]

trainX <- trainData[,0:4]
trainY <- trainData$Species

# Look at a summary of the training data
sapply(trainX, summary)

# SVM - First pass
set.seed(1492)

# Set up for cross validation
ctrl <- trainControl(method="repeatedcv", 
                     repeats=5, 
                     classProbs = TRUE)

# Train and tune the SVM
svm.tune <- train(x=trainX,
                  y=trainData$Species,
                  method="svmRadial",
                  tuneLength = 9,
                  preProc = c("center", "scale"),
                  metric="ROC",
                  trControl = ctrl)

svm.tune

# Second pass
grid <- expand.grid(sigma = c(0.75, 0.78, 0.81),
                    C = c(0.75, 0.9, 1, 1.1, 1.2))

# train and tune
svm.tune <- train(x=trainX,
                  y=trainData$Species,
                  method="svmRadial",
                  preProc = c("center", "scale"),
                  metric="ROC",
                  tuneGrid = grid,
                  trControl = ctrl)

svm.tune
