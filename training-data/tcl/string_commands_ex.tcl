set s "Hello, Tcl"
puts [string length $s]
puts [string toupper $s]
puts [string range $s 7 end]
puts [string map {Hello Bye} $s]
puts [string first "Tcl" $s]
puts [format "%05.1f|%-4s|%x" 3.14159 ab 255]
