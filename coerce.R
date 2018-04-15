# Change columns to numeric using dplyr (don't change)
library(dplyr)
example <- mutate_each(att5, funs(as.numeric), -state)

# Define vector containing numerical columns: cols
cols <- 2:ncol(att5)

# Use sapply to coerce cols to numeric
att5[, cols] <- sapply(att5[, cols], as.numeric)