proc two_sum {nums target} {
    array set seen {}
    for {set i 0} {$i < [llength $nums]} {incr i} {
        set n [lindex $nums $i]
        set complement [expr {$target - $n}]
        if {[info exists seen($complement)]} {
            return [list $seen($complement) $i]
        }
        set seen($n) $i
    }
    return {}
}

puts [two_sum {2 7 11 15} 9]
