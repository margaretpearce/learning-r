library(rpart)

data <- read.csv("data/iris.csv")
head(data)
colnames(data)

# Use xtabs to summarize the number of cases in each class
xtabs( ~ Species, data = data)

# Fit a classification tree
data.rpart1 = rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=data)

# Can the tree be simplified (pruned)?
plotcp(data.rpart1)
print(data.rpart1)
summary(data.rpart1)

# Prune the tree using cross validation to identify the point to prune
data.tree1 = tree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=data)
summary(data.tree1)
cv.tree(data.tree1)
