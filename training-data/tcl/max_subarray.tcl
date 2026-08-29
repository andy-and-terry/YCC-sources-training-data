proc kadane {items} {
    set best [lindex $items 0]
    set current [lindex $items 0]
    for {set i 1} {$i < [llength $items]} {incr i} {
        set x [lindex $items $i]
        set sum [expr {$current + $x}]
        set current [expr {$x > $sum ? $x : $sum}]
        set best [expr {$current > $best ? $current : $best}]
    }
    return $best
}

puts [kadane {-2 1 -3 4 -1 2 1 -5 4}]
