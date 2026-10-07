proc nextGreaterElements {nums} {
    set n [llength $nums]
    set result [lrepeat $n -1]
    set stack {}

    for {set i 0} {$i < $n} {incr i} {
        set value [lindex $nums $i]
        while {[llength $stack] > 0 && [lindex $nums [lindex $stack end]] < $value} {
            set idx [lindex $stack end]
            set stack [lrange $stack 0 end-1]
            lset result $idx $value
        }
        lappend stack $i
    }
    return $result
}

puts [nextGreaterElements {2 1 2 4 3}]
