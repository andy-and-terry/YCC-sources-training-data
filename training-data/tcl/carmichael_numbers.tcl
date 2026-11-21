# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
proc gcd {a b} {
    while {$b != 0} { lassign [list $b [expr {$a % $b}]] a b }
    return $a
}

proc pow_mod {b e m} {
    set r 1
    set b [expr {$b % $m}]
    while {$e > 0} {
        if {$e & 1} { set r [expr {$r * $b % $m}] }
        set b [expr {$b * $b % $m}]
        set e [expr {$e >> 1}]
    }
    return $r
}

proc is_prime {n} {
    for {set p 2} {$p * $p <= $n} {incr p} {
        if {$n % $p == 0} { return 0 }
    }
    return [expr {$n > 1}]
}

proc is_carmichael {n} {
    if {[is_prime $n]} { return 0 }
    for {set a 2} {$a < $n} {incr a} {
        if {[gcd $a $n] == 1 && [pow_mod $a [expr {$n - 1}] $n] != 1} { return 0 }
    }
    return 1
}

set out {}
for {set n 3} {$n < 3000} {incr n 2} {
    if {[is_carmichael $n]} { lappend out $n }
}
puts [join $out " "]
