# Visualizing multivariate relationships in large datasets
# Tutorial from:
# https://dmwiig.net/2017/02/06/r-tutorial-visualizing-multivariate-relationships-in-large-datasets/
library(nlme)

# Look at the structure of the data set
attach(MathAchieve)
str(MathAchieve)

# 7185 observations, 6 variables (3 numeric, 3 factors)
# SES: socia-economic status
# MathAch: numeric vectoe measuring mathematics achievement scores
# MEANSES: vector measuring mean SES for school attended by each student

# Correlation with three numeric variables
data("MathAchieve")
cor(as.matrix(MathAchieve[c(4,5,6)]), method="pearson")

# Scatterplot
library("scatterplot3d")
scatterplot3d(SES, MEANSES, MathAch, main="3D Scatterplot example")

# Add regression plane to the plot
linreg_model = lm(MathAch ~ SES + MEANSES)
summary(linreg_model)

