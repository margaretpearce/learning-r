# Lubridate tutorial
# https://www.r-bloggers.com/lubridate-working-with-date-and-time-in-r/
library(lubridate)

# Create an object
bday <- dmy("12021989")

# Pieces of the day
wday(bday) # day of the week
wday(bday, label=T) # day of the weeb abbreviated
yday(bday) # day of the year

# Calculations with dates
wday(bday + years(1), label=T) # day of the week a year later
365 %% 7 # 365 mod 7 == how many days should it shift?

# days of the week for next 100 years.
table(sapply(1:100, function(x) wday(bday + years(x), label=T)))
