set s "Hello, Tcl"
puts [string length $s]
puts [string toupper $s]
puts [string range $s 0 4]
puts [string map {Hello Bye Tcl World} $s]
puts [format "%-6s|%04d|%.2f" ab 42 3.14159]
