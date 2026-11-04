proc ugly {n} {
    set seq {1}
    set i2 0; set i3 0; set i5 0
    while {[llength $seq] < $n} {
        set c2 [expr {[lindex $seq $i2] * 2}]
        set c3 [expr {[lindex $seq $i3] * 3}]
        set c5 [expr {[lindex $seq $i5] * 5}]
        set next [expr {min($c2, $c3, $c5)}]
        lappend seq $next
        if {$next == $c2} { incr i2 }
        if {$next == $c3} { incr i3 }
        if {$next == $c5} { incr i5 }
    }
    lindex $seq end
}

set out {}
for {set i 1} {$i <= 12} {incr i} { lappend out [ugly $i] }
puts [join $out " "]
