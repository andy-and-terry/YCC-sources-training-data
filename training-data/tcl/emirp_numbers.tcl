# Emirps: primes whose digit reversal is a different prime.
proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} { return 0 }
    }
    return 1
}

set emirps {}
for {set n 2} {$n < 100} {incr n} {
    set r [string trimleft [string reverse $n] 0]
    if {$r != $n && [is_prime $n] && [is_prime $r]} { lappend emirps $n }
}
puts $emirps
