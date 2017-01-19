library(ggplot2)
setInternet2(use=FALSE)

myData <- read.table("data/ggplot2_tutorial_dataset.txt", header=T, sep="\t")
str(myData)

# Histogram of body mass
qplot(data=myData, x=BM, main="Histogram of BodyMass")

# Scatterplot of BM/var1, color by tribe
qplot(data=myData, x=BM, y=var1, log="xy", color=Tribe)

# Same but remove log scale axes
qplot(data=myData, x=log(BM), y=log(var1), color=Tribe)

# Boxplots
qplot(data=myData, x=Hab, y=var1, geom="boxplot")
