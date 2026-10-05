proc spiral_order {matrix} {
    set top 0
    set bottom [expr {[llength $matrix] - 1}]
    set left 0
    set right [expr {[llength [lindex $matrix 0]] - 1}]
    set out {}

    while {$top <= $bottom && $left <= $right} {
        for {set c $left} {$c <= $right} {incr c} {
            lappend out [lindex $matrix $top $c]
        }
        incr top
        for {set r $top} {$r <= $bottom} {incr r} {
            lappend out [lindex $matrix $r $right]
        }
        incr right -1
        if {$top <= $bottom} {
            for {set c $right} {$c >= $left} {incr c -1} {
                lappend out [lindex $matrix $bottom $c]
            }
            incr bottom -1
        }
        if {$left <= $right} {
            for {set r $bottom} {$r >= $top} {incr r -1} {
                lappend out [lindex $matrix $r $left]
            }
            incr left
        }
    }
    return $out
}

puts [spiral_order {{1 2 3} {4 5 6} {7 8 9}}]
