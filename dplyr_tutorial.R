# Tutorial from:
# http://genomicsclass.github.io/book/pages/dplyr_tutorial.html

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

# Pipe operator
msleep %>% select(name, sleep_total) %>% head

# Arrange rows by a particular column (e.g. sort) - two ways
head(arrange(msleep, order))
msleep %>% arrange(order) %>% head

# Select 3 columns, sort two levels
msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%
  head

# Select 3, sort two levels, then apply filter
msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%
  filter(sleep_total >= 16)

# Sort in descending order instead of ascending
msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>%
  filter(sleep_total >= 16)

# Create new columns
msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head

# Add two columns at once
msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total,
         bodywt_grams = bodywt * 1000) %>%
  head

# Create summaries of the data frame
msleep %>% 
  summarise(avg_sleep = mean(sleep_total))

msleep %>%
  summarize(avg_sleep = mean(sleep_total),
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            std_sleep = sd(sleep_total),
            total = n())

# Group operations
msleep %>%
  group_by(order) %>%
  summarize(avg_sleep = mean(sleep_total),
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            std_sleep = sd(sleep_total),
            total = n())