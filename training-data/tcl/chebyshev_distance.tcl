proc chebyshev {a b} {
    set m 0
    foreach x $a y $b {
        set d [expr {abs($x - $y)}]
        if {$d > $m} { set m $d }
    }
    return $m
}
puts [chebyshev {1 2} {4 6}]
