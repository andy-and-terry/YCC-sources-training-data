set matrix {{1 2 3} {4 5 6} {7 8 9}}

puts [lindex $matrix 1]
puts [lindex $matrix 1 2]
puts [lindex $matrix {2 0}]
puts [lindex $matrix end end]

set row [lindex $matrix 0]
puts [expr {[lindex $row 0] + [lindex $row end]}]
puts "<[lindex {a b c} 10]>"
