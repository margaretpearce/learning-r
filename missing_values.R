# Load data
data <- iris
summary(iris)

# Seed missing values into the data
library(missForest)
iris.mis <- prodNA(iris, noNA=0.1)
summary(iris.mis)
