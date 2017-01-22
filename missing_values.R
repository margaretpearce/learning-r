# Tutorial:
# https://www.analyticsvidhya.com/blog/2016/03/tutorial-powerful-packages-imputing-missing-values/

# Load data
data <- iris
summary(iris)

# Seed missing values into the data
library(missForest)
iris.mis <- prodNA(iris, noNA=0.1)
summary(iris.mis)

# Remove categorical variables
iris.mis <- subset(iris.mis, select = -c(Species))
summary(iris.mis)

library(mice)
# Row: num observations, 0 if missing value in this col else 1, missing vals per row
md.pattern(iris.mis)

library(VIM)
mice_plot <- aggr(iris.mis, col=c("navyblue", "yellow"),
                  numbers=TRUE, sortVars=TRUE, labels=names(iris.mis),
                  cex.axis=0.7, gap=3, ylab=c("Missing data","Pattern"))

# Impute the missing values (predictive mean matching)
imputed_data <- mice(iris.mis, m=5, maxit=50, method="pmm", seed=500)
summary(imputed_data)
