# SVM tuning examples
# Courtesy of: 
# http://www.cs.upc.edu/~belanche/Docencia/mineria/English-september-2008/Practical-work/Labo-SVMs.R
library(e1071)

# Generate some artificial data
data <- seq(1,10)
classes <- c('b','b','b','b','a','a','a','a','b','b')

# Linear SVM - 4 misclassified
linear_svm <- svm(data, classes, type='C', kernel='linear')
prediction_linear <- predict(linear_svm, data)
table(prediction_linear, classes)

# Polynomial SVM - better! 2 misclassified
polynomial_svm <- svm(data, classes, type='C', kernel='polynomial', degree=2)
prediction_poly <- predict(polynomial_svm, data)
table(prediction_poly, classes)

# Radial SVM - back to 4 misclassified
radial_svm <- svm(data, classes, type='C', kernel='radial', gamma=0.1)
prediction_radial <- predict(radial_svm, data)
table(prediction_radial, classes)

# Radial SVM - adjusted parameters, 0 misclassified
radial_svm_2 <- svm(data, classes, type='C', kernel='radial', gamma=0.1, cost=10)
prediction_radial_2 <- predict(radial_svm_2, data)
table(prediction_radial_2, classes)

# Example:
# Predict the type of glass based on its chemical analysis
library(mlbench)
library(rpart)

data(Glass)

# Split train/ test
index <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3))
testset <- Glass[testindex,]
trainset <- Glass[-testindex,]

# Fit the model
glass_svm <- svm(Type ~ ., data=trainset, cost=100, gamma=1)
glass_predictions <- predict(glass_svm, testset[,-10])
table(pred=glass_predictions, true=testset[,10])

# Tune using grid search
glass_svm_tuned <- tune.svm(Type ~ ., data=trainset, gamma=2^(-1:1), cost = 2^(2:4))
summary(glass_svm_tuned)

plot(glass_svm_tuned, transform.x=log10, xlab=expression(log[10](gamma)), ylab="C")