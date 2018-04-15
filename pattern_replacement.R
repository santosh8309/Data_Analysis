# View text containing phone numbers
contact

# Replace digits with "X"
str_replace(contact, pattern = DGT , replacement = "X")

# Replace all digits with "X"
str_replace_all(contact, pattern = DGT , replacement = "X")

# Replace all digits with different symbol
str_replace_all(contact, pattern = DGT , replacement = c("X", ".", "*", "_"))