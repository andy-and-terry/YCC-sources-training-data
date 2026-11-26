# Goldbach partitions of 100; expect 6.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

set c 0
for {set p 2} {$p <= 50} {incr p} {
    if {[isPrime $p] && [isPrime [expr {100 - $p}]]} {
        puts "$p+[expr {100 - $p}]"
        incr c
    }
}
puts $c
