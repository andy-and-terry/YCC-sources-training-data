set s "Hello, Tcl"
puts [string toupper $s]
puts [string length $s]
puts [string range $s 7 end]
puts [string map {Hello Bye} $s]
