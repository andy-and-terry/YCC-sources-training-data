# Stack and queue built directly on Tcl lists
set stack {}
foreach x {1 2 3} { lappend stack $x }
puts "stack: $stack"
set top [lindex $stack end]
set stack [lrange $stack 0 end-1]
puts "pop: $top, rest: $stack"

set queue {}
lappend queue a b c
set front [lindex $queue 0]
set queue [lrange $queue 1 end]
puts "dequeue: $front, rest: $queue"

puts "$first $rest"
puts [llength {a {b c} d}]
puts [lsearch -all {a b a c a} a]
