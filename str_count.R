# Count occurrences of "a" in girl_names
number_as <- str_count(girl_names, fixed("a"))

# Count occurrences of "A" in girl_names
number_As <- str_count(girl_names, fixed("A"))

# Histograms of number_as and number_As
hist(number_as)
hist(number_As)

# Find total "a" + "A"
total_as <- number_as + number_As

# girl_names with more than 4 a's
girl_names[total_as > 4]