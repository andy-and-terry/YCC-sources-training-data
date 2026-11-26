# Circular primes below 100; expect 13.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

proc circular {n} {
    set len [string length $n]
    for {set i 0} {$i < $len} {incr i} {
        set r [string trimleft "[string range $n $i end][string range $n 0 [expr {$i - 1}]]" 0]
        if {![isPrime $r]} { return 0 }
    }
    return 1
}
set c 0
for {set n 2} {$n < 100} {incr n} { if {[circular $n]} { incr c } }
puts $c
