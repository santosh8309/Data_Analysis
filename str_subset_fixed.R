# Find boy_names that contain "zz"
str_subset(boy_names, fixed("zz"))

# Find girl_names that contain "zz"
str_subset(girl_names, fixed("zz"))

# Find girl_names that contain "U"
starts_U <- str_subset(girl_names, fixed("U"))
starts_U

# Find girl_names that contain "U" and "z"
str_subset(starts_U, fixed("z"))
