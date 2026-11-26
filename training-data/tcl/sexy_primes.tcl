# Sexy primes below 100; expect 16 pairs.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

set c 0
for {set p 2} {$p < 100} {incr p} {
    if {[isPrime $p] && [isPrime [expr {$p + 6}]]} { incr c }
}
puts $c
