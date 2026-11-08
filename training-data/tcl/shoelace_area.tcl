proc shoelace {pts} {
    set n [llength $pts]
    set s 0
    for {set i 0} {$i < $n} {incr i} {
        lassign [lindex $pts $i] x1 y1
        lassign [lindex $pts [expr {($i + 1) % $n}]] x2 y2
        set s [expr {$s + $x1 * $y2 - $x2 * $y1}]
    }
    expr {abs($s) / 2.0}
}
puts [shoelace {{0 0} {4 0} {4 3} {0 3}}]
