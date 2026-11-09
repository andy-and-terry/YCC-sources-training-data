set s "Hello, Tcl"
puts [string length $s]
puts [string toupper $s]
puts [string range $s 0 4]
puts [string map {Hello Bye} $s]
puts [string match "H*" $s]
puts [format "%05.1f|%-4s|" 3.14159 ab]
