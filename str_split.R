date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")

# Split dates using " - "
split_dates <- str_split(date_ranges, fixed(" - "))

# Print split_dates
split_dates

# Split dates with n and simplify specifed
split_dates_n <- str_split(date_ranges, fixed(" - "), n = 2, simplify = TRUE)
split_dates_n

# Subset split_dates_n into start_dates and end_dates
start_dates <- split_dates_n[ , 1]
end_dates <- split_dates_n[ , 2]

# Split start_dates into day, month and year pieces
str_split(start_dates, fixed("."), n = 3, simplify = TRUE)

# Split both_names into first_names and last_names
both_names <- c("Box, George", "Cox, David")
both_names_split <- str_split(both_names, fixed(", "), n = 2, simplify = TRUE)
first_names <- both_names_split[, 2]
last_names <- both_names_split[, 1]
