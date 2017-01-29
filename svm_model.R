# SVM modeling tutorial
# https://www.r-bloggers.com/the-5th-tribe-support-vector-machines-and-caret/

library(caret)
library(dplyr)
library(kernlab)
library(pROC)

data(iris)
trainIndex <- createDataPartition(iris$Species, p=0.8, list=FALSE)
