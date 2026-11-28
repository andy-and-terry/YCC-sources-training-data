proc duval {s} {
    set n [string length $s]
    set out {}
    set i 0
    while {$i < $n} {
        set j [expr {$i + 1}]; set k $i
        while {$j < $n && [string index $s $k] <= [string index $s $j]} {
            if {[string index $s $k] < [string index $s $j]} { set k $i } else { incr k }
            incr j
        }
        while {$i <= $k} {
            lappend out [string range $s $i [expr {$i + $j - $k - 1}]]
            incr i [expr {$j - $k}]
        }
    }
    return $out
}
puts [duval banana]
