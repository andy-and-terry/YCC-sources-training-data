proc lengthOfLIS {nums} {
    set n [llength $nums]
    if {$n == 0} {
        return 0
    }
    array set dp {}
    for {set i 0} {$i < $n} {incr i} {
        set dp($i) 1
    }

    for {set i 1} {$i < $n} {incr i} {
        for {set j 0} {$j < $i} {incr j} {
            if {[lindex $nums $j] < [lindex $nums $i] && [expr {$dp($j) + 1}] > $dp($i)} {
                set dp($i) [expr {$dp($j) + 1}]
            }
        }
    }

    set best 0
    for {set i 0} {$i < $n} {incr i} {
        if {$dp($i) > $best} {
            set best $dp($i)
        }
    }
    return $best
}

puts [lengthOfLIS {10 9 2 5 3 7 101 18}]
