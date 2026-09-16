proc sliding_window_maximum {values k} {
    set deque {}
    set result {}
    set n [llength $values]
    for {set i 0} {$i < $n} {incr i} {
        set v [lindex $values $i]

        while {[llength $deque] > 0 && [lindex $deque 0] <= [expr {$i - $k}]} {
            set deque [lrange $deque 1 end]
        }

        while {[llength $deque] > 0 && [lindex $values [lindex $deque end]] <= $v} {
            set deque [lrange $deque 0 [expr {[llength $deque] - 2}]]
        }

        lappend deque $i
        if {$i >= $k - 1} {
            lappend result [lindex $values [lindex $deque 0]]
        }
    }
    return $result
}

puts [sliding_window_maximum {1 3 -1 -3 5 3 6 7} 3]
puts [sliding_window_maximum {9 8 7 6 5} 2]
