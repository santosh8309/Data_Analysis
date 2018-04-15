# Match Jeffrey or Geoffrey
whole_names <- or("Jeffrey", "Geoffrey")
str_view(boy_names, pattern = whole_names,match = TRUE)

# Match Jeffrey or Geoffrey, another way
common_ending <- or("Je", "Geo") %R% "ffrey"
str_view(boy_names, pattern = common_ending,match = TRUE)

# Match with alternate endings
by_parts <- or("Je","Geo") %R% "ff" %R% or("ry","ery", "rey", "erey")
str_view(boy_names, pattern = by_parts,match = TRUE)

# Match names that start with Cath or Kath
ckath <- START %R% or ("C", "K") %R% "ath"
str_view(girl_names, pattern = ckath , match = TRUE)
