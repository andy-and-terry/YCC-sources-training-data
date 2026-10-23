# Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
proc zeckendorf {n} {
    set fibs {1 2}
    while {[lindex $fibs end] + [lindex $fibs end-1] <= $n} {
        lappend fibs [expr {[lindex $fibs end] + [lindex $fibs end-1]}]
    }
    set parts {}
    foreach f [lreverse $fibs] {
        if {$f <= $n} {
            lappend parts $f
            set n [expr {$n - $f}]
        }
    }
    return $parts
}

puts [join [zeckendorf 100] " "]
