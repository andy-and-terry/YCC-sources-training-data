# Pernicious numbers: the popcount is prime.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

proc popcount {n} {
    set c 0
    while {$n > 0} {
        incr c [expr {$n & 1}]
        set n [expr {$n >> 1}]
    }
    return $c
}

set out {}
for {set n 1} {$n <= 20} {incr n} {
    if {[isPrime [popcount $n]]} { lappend out $n }
}
puts [join $out " "]
