set items {a b c d e f}

puts [lrange $items 1 3]
puts [lrange $items end-1 end]
puts [linsert $items 2 X Y]
puts [lreplace $items 1 2 B]
puts [lreplace $items 1 2]
puts [lindex $items end]
puts [lindex {{1 2} {3 4}} 1 0]
puts [llength $items]

lappend items g h
puts $items

set copy $items
lset copy 0 FIRST
puts "$copy | $items"

puts [lreverse $items]
puts [lsearch $items d]
puts [lsearch $items zzz]
puts [join [lrange $items 0 2] ", "]
puts [split "a:b:c" :]
puts [concat {1 2} {3 4} 5]
puts [lrepeat 3 x]
puts [list a {b c} d]
puts [llength [list a {b c} d]]

set stack {}
lappend stack 1 2 3
set top [lindex $stack end]
set stack [lreplace $stack end end]
puts "popped $top, left $stack"
