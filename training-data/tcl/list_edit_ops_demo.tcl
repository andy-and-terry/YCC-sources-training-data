set items {a b c d e}

puts [lrange $items 1 3]
puts [linsert $items 2 X Y]
puts [lreplace $items 1 2 B]
puts [lreplace $items 0 0]
puts [lindex $items end]
puts [lindex $items end-1]

lappend items f g
puts "len=[llength $items]"

puts [lreverse $items]
puts [lrepeat 3 0]
puts [concat {1 2} {3 4} 5]

set matrix {{1 2 3} {4 5 6}}
puts [lindex $matrix 1 2]
lset matrix 0 1 99
puts $matrix
