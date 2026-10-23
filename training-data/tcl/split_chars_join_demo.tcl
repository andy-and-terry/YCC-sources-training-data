# split with no separator breaks a string into characters
set chars [split "tcl"]
puts [llength $chars]
puts [split "abc" ""]

# several separator characters at once
set parts [split "a,b;c d" ",; "]
puts $parts

# empty fields are preserved
puts [llength [split "a,,b" ","]]

# join with a custom separator
puts [join {2024 01 15} "-"]
puts [join {a b c} ""]
