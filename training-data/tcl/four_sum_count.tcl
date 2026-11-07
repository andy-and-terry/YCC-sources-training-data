proc four_sum_count {a b c d} {
    array set sums {}
    foreach x $a { foreach y $b {
        set k [expr {$x + $y}]
        if {[info exists sums($k)]} { incr sums($k) } else { set sums($k) 1 }
    } }
    set count 0
    foreach x $c { foreach y $d {
        set k [expr {-($x + $y)}]
        if {[info exists sums($k)]} { incr count $sums($k) }
    } }
    return $count
}

puts [four_sum_count {1 2} {-2 -1} {-1 2} {0 2}] ;# 2
