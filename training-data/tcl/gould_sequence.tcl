proc popcount {n} {
    set c 0
    while {$n > 0} {
        incr c [expr {$n & 1}]
        set n [expr {$n >> 1}]
    }
    return $c
}

set out {}
for {set n 0} {$n < 16} {incr n} {lappend out [expr {1 << [popcount $n]}]}
puts $out
