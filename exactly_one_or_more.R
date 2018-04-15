# Vowels from last exercise
vowels <- char_class("aeiouAEIOU")

# Use `negated_char_class()` for everything but vowels
not_vowels <-  negated_char_class("aeiouAEIOU")

# See names with only vowels
str_view(boy_names, 
  pattern = exactly(one_or_more(vowels)), 
  match = TRUE)

# See names with no vowels
str_view(boy_names, pattern = exactly(one_or_more(not_vowels)),
  match = TRUE)