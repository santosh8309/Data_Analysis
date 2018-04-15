# Take a look at ALL digits
str_view_all(contact, DGT)

# Create a three digit pattern and test
three_digits <- DGT %R% DGT %R% DGT
str_view_all(contact,
  pattern = three_digits)

# Create four digit pattern
four_digits <- three_digits %R% DGT

# Create a separator pattern and test
separator <- char_class("-.() ")
str_view_all(contact,
  pattern = separator)

# Create phone pattern
phone_pattern <- optional(OPEN_PAREN) %R% 
  three_digits %R% 
  zero_or_more(separator) %R% 
  three_digits %R% 
  zero_or_more(separator) %R%
  four_digits
        
# Test pattern           
str_view(contact, pattern = phone_pattern)

# Extract phone numbers
str_extract(contact, phone_pattern)

# Extract ALL phone numbers
str_extract_all(contact, phone_pattern)