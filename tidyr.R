# tidyr tutorial
# https://www.r-bloggers.com/data-manipulation-with-tidyr/

library(tidyr)
library(dplyr)

# mtcars dataset from datasets library
head(mtcars)

# Add names of cars
mtcars$car <- rownames(mtcars)
mtcars <- mtcars[, c(12, 1:11)]
head(mtcars)

# gather columns to replicate what melt() does
mtcarsNew <- mtcars %>% gather(attribute, value, -car)
head(mtcarsNew)
tail(mtcarsNew)

# gather all columns from mpg to gear, leave carb and car as they are
mtcarsNew2 <- mtcars %>% gather(attribute, value, mpg:gear)
head(mtcarsNew2)

# spread: replicate what cast() does, undo gather
mtcarsSpread <- mtcarsNew %>% spread(attribute, value)
head(mtcarsSpread)

# Create some fake data
set.seed(1)
date <- as.Date('2016-01-01') + 0:14
hour <- sample(1:24, 15)
min <- sample(1:60, 15)
second <- sample(1:60, 15)
event <- sample(letters, 15)
data <- data.frame(date, hour, min, second, event)
data

# Combine time columns into a new column
dataNew <- data %>% unite(datehour, date, hour, sep = ' ') %>%
                    unite(datetime, datehour, min, second, sep=':')
dataNew

# separate- undo unite
dataSep <- dataNew %>% separate(datetime, c('date', 'time'), sep=' ') %>%
                       separate(time, c('hour', 'min', 'second'), sep=':')
dataSep
