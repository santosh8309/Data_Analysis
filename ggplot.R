# Find the row number of the incorrect value: i

i <- which(mbta6$Boat > 30)
# Replace the incorrect value with 4

mbta6$Boat[i] <- 4
# Generate a histogram of Boat column

hist(mbta6$Boat)
# Look at Boat and Trackless Trolley ridership over time (don't change)

ggplot(mbta_boat, aes(x = month, y = thou_riders, col = mode)) +  geom_point() + 
  scale_x_discrete(name = "Month", breaks = c(200701, 200801, 200901, 201001, 201101)) + 
  scale_y_continuous(name = "Avg Weekday Ridership (thousands)")

# Look at all T ridership over time (don't change)
ggplot(mbta_all, aes(x = month, y = thou_riders, col = mode)) + geom_point() + 
  scale_x_discrete(name = "Month", breaks = c(200701, 200801, 200901, 201001, 201101)) +  
  scale_y_continuous(name = "Avg Weekday Ridership (thousands)")