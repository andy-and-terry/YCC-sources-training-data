proc cube_from_odds {n} {
    set start [expr {$n * $n - $n + 1}]
    set sum 0
    for {set i 0} {$i < $n} {incr i} {
        incr sum [expr {$start + 2 * $i}]
    }
    return $sum
}

for {set n 1} {$n <= 5} {incr n} {
    puts "$n [cube_from_odds $n] [expr {[cube_from_odds $n] == $n * $n * $n}]"
}
