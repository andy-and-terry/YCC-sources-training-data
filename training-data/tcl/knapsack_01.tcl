proc knapsack {weights values capacity} {
    array set dp {}
    for {set c 0} {$c <= $capacity} {incr c} {
        set dp($c) 0
    }
    for {set i 0} {$i < [llength $weights]} {incr i} {
        set w [lindex $weights $i]
        set v [lindex $values $i]
        for {set cap $capacity} {$cap >= $w} {incr cap -1} {
            set withItem [expr {$dp([expr {$cap - $w}]) + $v}]
            if {$withItem > $dp($cap)} {
                set dp($cap) $withItem
            }
        }
    }
    return $dp($capacity)
}

puts [knapsack {2 3 4 5} {3 4 5 6} 5]
