# Sophie Germain primes: p prime and 2p + 1 prime.
proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}
set out {}
for {set p 2} {$p < 100} {incr p} {
    if {[is_prime $p] && [is_prime [expr {2 * $p + 1}]]} { lappend out $p }
}
puts [join $out " "]
