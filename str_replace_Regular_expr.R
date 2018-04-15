# age_gender, age, gender, unit are pre-defined
ls.str()

# Extract age and make numeric
ages_numeric <- as.numeric(str_extract(age_gender, age))

# Replace age and units with ""
genders <- str_replace(age_gender, 
  pattern = age %R% unit, 
  replacement = "")

# Replace extra spaces
genders_clean <- str_replace_all(genders, 
  pattern = one_or_more(SPC), 
  replacement = "")

# Extract units 
time_units <- str_extract(age_gender, unit)

# Extract first word character
time_units_clean <- str_extract(time_units, WRD)

# Turn ages in months to years
ages_years <- ifelse(time_units_clean == "Y", ages_numeric, ages_numeric/12)