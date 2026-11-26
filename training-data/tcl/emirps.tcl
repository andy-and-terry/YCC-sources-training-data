# Emirps below 200; expect 15.
proc isPrime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}

set c 0
for {set n 2} {$n < 200} {incr n} {
    set r [string trimleft [string reverse $n] 0]
    if {$r != $n && [isPrime $n] && [isPrime $r]} { incr c }
}
puts $c
