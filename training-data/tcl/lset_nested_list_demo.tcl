set grid {{1 2 3} {4 5 6} {7 8 9}}

# lset with multiple indices updates a nested element in place
lset grid 1 1 50
puts $grid

# "end" and end-N work as indices
lset grid end end 90
puts $grid

# replace a whole row
lset grid 0 {10 20 30}
puts $grid

# lindex with several indices reads nested elements
puts [lindex $grid 2 0]
puts [lindex $grid 1 end]
