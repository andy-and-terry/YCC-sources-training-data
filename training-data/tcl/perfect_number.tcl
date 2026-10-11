proc isPerfect {n} {
    if {$n < 2} { return 0 }
    set sum 1
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} {
            incr sum $d
            set other [expr {$n / $d}]
            if {$other != $d} { incr sum $other }
        }
    }
    return [expr {$sum == $n}]
}

for {set i 1} {$i <= 10000} {incr i} {
    if {[isPerfect $i]} { puts $i }
}
