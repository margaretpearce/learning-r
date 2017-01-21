# Following r-bloggers tutorial
# https://www.r-bloggers.com/outlier-detection-and-treatment-with-r/

require(stats); require(graphics)

# Initial plot
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)", las = 1)

# Inject outliers into the data
cars_subset <- cars[1:30,]
cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist=c(190,186,210,220,218))
cars_with_outliers <- rbind(cars_subset, cars_outliers)

# Plot the data with outliers
par(mfrow=c(1,2))
plot(cars_with_outliers$speed, cars_with_outliers$dist, xlim=c(0,28), ylim=c(0,230), 
     main="With Outliers", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist~speed, data=cars_with_outliers), col="blue", lwd=3, lty=2)

# Plot the original data without outliers to show how the line is changed
plot(cars_subset$speed, cars_subset$dist, xlim=c(0,28), ylim=c(0,230), 
     main="Outliers removed \n A much better fit!", xlab="speed", ylab="dist",
     pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars_subset), col="blue", lwd=3, lty=2)

# Detect outliers - univariate approach
outlier_values <- boxplot.stats(cars_with_outliers$dist)$out
boxplot(cars_with_outliers$dist, main="Distance", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse = ", ")), cex=0.6)

# Bivariate approach (different data set)
url <- "http://rstatistics.net/wp-content/uploads/2015/09/ozone.csv"
ozone <- read.csv(url)

# Clear pattern
boxplot(ozone_reading ~ Month, data=ozone, main="Ozone reading across months")

# No clear pattern
boxplot(ozone_reading ~ Day_of_week, data=ozone, main="Ozone reading for days of week")

boxplot(ozone_reading ~ pressure_height, data=ozone, 
        main="Boxplot for pressure height (continuous variable) vs Ozone")

# Treat pressure height as categorical
boxplot(ozone_reading ~ cut(pressure_height, pretty(ozone$pressure_height)), data=ozone,
        main="Boxplot for Pressure height (categorical) vs Ozone", cex.axis=0.5)

# Cook's distance: compute influence exerted by each data point on predicted outcome
mod <- lm(ozone_reading ~ ., data=ozone)
cooksd <- cooks.distance(mod)

# Plot Cook's distance
plot(cooksd, pch="*", cex=2, main="Influential Obs by Cooks distance")

# Print horizontal line delineating which points > 4*mean of Cook's distance
abline(h = 4*mean(cooksd, na.rm=T), col="red")

# Add labels
text(x=1:length(cooksd)+1, y=cooksd, 
     labels=ifelse(cooksd > 4*mean(cooksd, na.rm=T),names(cooksd), ""),
     col="red")
