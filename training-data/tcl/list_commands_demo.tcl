set items {a b c d e}

puts [lrange $items 1 3]
puts [linsert $items 2 X]
puts [lreplace $items 1 2 Y Z]
puts [lreverse $items]
puts [lindex $items end]
puts [lindex $items end-1]
puts [lsearch $items c]
puts [lrepeat 3 ab]

set matrix {{1 2} {3 4}}
puts [lindex $matrix 1 0]
lset matrix 0 1 99
puts $matrix

# lappend modifies in place; concat joins lists
lappend items f
puts [concat $items {g h}]

# lassign with leftovers
lassign {1 2 3 4} p q rest
puts "$p $q | $rest"
