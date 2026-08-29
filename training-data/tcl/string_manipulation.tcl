set s "Hello, Tcl World!"

puts [string toupper $s]
puts [string tolower $s]
puts [string length $s]
puts [split $s " "]
puts [string map {World Programming} $s]
