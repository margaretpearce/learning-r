library(dplyr)

# Read in the CSV and print the first few rows
msleep <- read.csv("data/msleep_ggplot2.csv")
head(msleep)

# Select a set of columns
sleepData <- select(msleep, name, sleep_total)
head(sleepData)

# Select all columns except "name"
head(select(msleep, -name))

# Select a range of columns by name
head(select(msleep, vore:conservation))

# Select all columns that start with the character string "sl"
head(select(msleep, starts_with("sl")))

# Filter for mammals that sleep >= 16 hours
filter(msleep, sleep_total >= 16)

# Filter sleep >= 16 AND body weight >= 1
filter(msleep, sleep_total >= 16, bodywt >= 1)

# Filter order == Primates or Cingulata
filter(msleep, order %in% c("Primates", "Cingulata"))
