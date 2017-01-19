# Tutorial from:
# R-bloggers: https://www.r-bloggers.com/r-tutorial-series-simple-linear-regression/
# http://www.statmethods.net/stats/regression.html

data <- read.csv("data/dataset_simpleRegression.csv")
head(data)

# Create a linear model
linearModel <- lm(ROLL ~ UNEM, data)
linearModel

# What is the expected fall enrollment (ROLL) given unemployment of 9%?
3957 + 1134 * 9

# Model overview
summary(linearModel)

# Multiple linear regression
fit <- lm(ROLL ~ YEAR + UNEM + HGRAD + INC, data)
summary(fit)

# Getting pieces from the model
coefficients(fit)           # coefficients
confint(fit, level=0.95)    # confidence intervals
fitted(fit)                 # predicted values
data$ROLL                   # compare with actual values
residuals(fit)              # residuals
anova(fit)                  # ANOVA table
vcov(fit)                   # covariance matrix for model parameters
influence(fit)              # regression diagnostics