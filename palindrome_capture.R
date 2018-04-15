# See names with three repeated letters
repeated_three_times <- capture(LOWER) %R% REF1 %R% REF1 
str_view(boy_names, pattern = repeated_three_times, match = TRUE)

# See names with a pair of repeated letters
pair_of_repeated <- capture(LOWER %R% LOWER) %R% REF1  
str_view(boy_names, pattern = pair_of_repeated, match = TRUE)

# See names with a pair that reverses
pair_that_reverses <- capture(LOWER) %R% capture(LOWER) %R% REF2 %R% REF1
str_view(boy_names,pattern = pair_that_reverses, match = TRUE)

# See four letter palindrome names
four_letter_palindrome <- exactly(capture(LOWER) %R% capture(LOWER) %R% REF2 %R% REF1)
str_view(boy_names, pattern = four_letter_palindrome, match = TRUE)

# See six letter palindrome names
six_letter_palindrome <- exactly(capture(LOWER) %R% capture(LOWER) %R% capture(LOWER) %R% REF3 %R% REF2 %R% REF1)
str_view(boy_names, pattern = six_letter_palindrome, match = TRUE)
