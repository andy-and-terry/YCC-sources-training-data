set path "/usr/local/bin"
set parts [split $path /]
puts [llength $parts]
puts $parts
puts [join [lrange $parts 1 end] " > "]

puts [split "a1b2c3" {1 2 3}]
puts [split "abc" ""]
puts [join {1 2 3 4} +]
puts [expr [join {1 2 3 4} +]]
