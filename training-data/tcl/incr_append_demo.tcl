set n 10
incr n
incr n 5
incr n -3
puts $n

set msg "Hello"
append msg ", " "Tcl" "!"
puts $msg

set items {}
lappend items one
lappend items two three
puts $items
puts [llength $items]

puts [incr undefinedCounter]
