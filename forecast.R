# Time Series forecasting
# From: http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html

# Read in a data set
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings

# Parse to time series
kingstimeseries <- ts(kings)
kingstimeseries

# Another example: births per month in NYC
births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries

# Monthly sales for a souvenir shop
souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987,1))
souvenirtimeseries

# Plotting time series
plot.ts(kingstimeseries)
plot.ts(birthstimeseries)
