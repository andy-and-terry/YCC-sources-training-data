proc digit_sum {n} {
    set total 0
    foreach d [split $n ""] {
        incr total $d
    }
    return $total
}

proc is_smith {n} {
    set m $n
    set factor_sum 0
    set factor_count 0
    for {set p 2} {$p * $p <= $m} {incr p} {
        while {$m % $p == 0} {
            incr factor_sum [digit_sum $p]
            incr factor_count
            set m [expr {$m / $p}]
        }
    }
    if {$m > 1} {
        incr factor_sum [digit_sum $m]
        incr factor_count
    }
    return [expr {$factor_count > 1 && $factor_sum == [digit_sum $n]}]
}

set result {}
for {set n 4} {$n < 100} {incr n} {
    if {[is_smith $n]} {
        lappend result $n
    }
}
puts [join $result " "]
