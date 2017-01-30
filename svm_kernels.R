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
