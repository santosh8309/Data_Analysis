# Look for two digits
str_view(narratives, DGT %R% DGT)

# Pattern to match one or two digits
age <- DGT %R% optional(DGT)
str_view(narratives, 
  pattern = age)

# Pattern to match units 
unit <- optional(SPC) %R% or("YO", "YR", "MO")

# Test pattern with age then units
str_view(narratives, 
  pattern = age %R% unit)

# Pattern to match gender
gender <- optional(SPC) %R% or("M", "F")

# Test pattern with age then units then gender
str_view(narratives, 
  pattern = age %R% unit %R% gender)

# Extract age_gender, take a look
age_gender <- str_extract(narratives,  age %R% unit %R% gender)
age_gender
