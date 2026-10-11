set grid {{0 0 0} {0 0 0} {0 0 0}}

lset grid 1 1 5
lset grid 0 2 9
lset grid end end 7

foreach row $grid {
    puts $row
}

set v {a b c}
lset v 1 X
puts $v
