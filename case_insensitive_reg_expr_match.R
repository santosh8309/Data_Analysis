# View matches to "TRIP"
str_view(catcidents, 
  pattern = "TRIP", 
  match = TRUE)

# Construct case insensitive pattern
trip_pattern <- regex("TRIP", ignore_case = TRUE)

# View case insensitive matches to "TRIP"
str_view(catcidents, 
  pattern = trip_pattern, 
  match = TRUE)

# Get subset of matches
trip <- str_subset(catcidents, pattern = trip_pattern)

# Extract matches
str_extract(trip, pattern = trip_pattern)