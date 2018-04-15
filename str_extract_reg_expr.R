# Pattern for start word then .
pattern_1 <- START %R% one_or_more(WRD) %R% DOT

# Test pattern_1
str_view(play_lines, pattern = pattern_1, match = TRUE) 
str_view(play_lines, pattern = pattern_1, match = FALSE)

# Pattern for start, capital, word then .
pattern_2 <- START %R% ascii_upper() %R% one_or_more(WRD) %R% DOT

# View matches of pattern_2
str_view(play_lines, pattern = pattern_2, match = TRUE)

# View non-matches of pattern_2
str_view(play_lines, pattern = pattern_2, match = FALSE)

# Get subset of lines that match
lines <- str_subset(play_lines, pattern = pattern_2)

# Extract match from lines
who <- str_extract(lines, pattern=pattern_2)

# Let's see what we have
unique(who)