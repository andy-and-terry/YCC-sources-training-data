set s "   Hello, Tcl World!   "
puts [string trim $s]
puts [string trimleft $s]
puts [string trimright $s]

set line "id=42;name=Ada;role=admin"
puts [string replace $line 0 1 "ID"]

puts [string repeat "=" 10]

set path "/usr/local/bin"
puts [string first "/" $path 1]
puts [string last "/" $path]

set template "Hello NAME, you are AGE years old."
puts [string map {NAME Ada AGE 30} $template]
