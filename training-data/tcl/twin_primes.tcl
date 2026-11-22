# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}
set out {}
for {set p 2} {$p < 100} {incr p} {
    if {[is_prime $p] && [is_prime [expr {$p + 2}]]} { lappend out $p }
}
puts [join $out " "]
