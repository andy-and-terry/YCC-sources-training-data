set values {3 1 4 1 5 9 2 6}
set prefix {0}
foreach v $values {
    lappend prefix [expr {[lindex $prefix end] + $v}]
}

proc query {lo hi} {
    global prefix
    expr {[lindex $prefix $hi] - [lindex $prefix $lo]}
}

puts [query 2 5]
