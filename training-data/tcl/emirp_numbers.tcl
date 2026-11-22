# Emirps: primes whose digit reversal is a different prime.
proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}
set out {}
for {set n 2} {$n < 200} {incr n} {
    set r [scan [string reverse $n] %d]
    if {$r != $n && [is_prime $n] && [is_prime $r]} { lappend out $n }
}
puts [join $out " "]
