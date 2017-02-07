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

# Days of the week for next 100 years.
table(sapply(1:100, function(x) wday(bday + years(x), label=T)))

# Today's date
this_day <- today()
this_day
wday(this_day)

# Today's date and time
this_moment <- now()
this_moment
hour(this_moment)
minute(this_moment)
second(this_moment)
rbind(hour(this_moment), minute(this_moment), second(this_moment))

# Different input formats for dates
ymd_format <- ymd("1989-05-17")
ymd_format
year(ymd_format)

# Different internal R structure (not just a string)
class(ymd_format)

# No quotes
dmy(25081985)

# Missing "0" - fails (not 8 digits)
ymd("192016")

# Slashes
ymd("1920/1/2")
