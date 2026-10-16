set s "Hello, Tcl world"

puts [string range $s 0 4]
puts [string range $s 7 end]
puts [string index $s end]
puts [string index $s end-2]
puts [string first "l" $s]
puts [string last "l" $s]
puts [string length $s]
puts [string toupper $s]
puts [string replace $s 0 4 "Howdy"]
