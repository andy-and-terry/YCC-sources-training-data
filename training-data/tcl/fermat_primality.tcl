# Fermat primality test; Carmichael number 561 fools it.
proc powmod {b e m} {
    set r 1
    set b [expr {$b % $m}]
    while {$e > 0} {
        if {$e & 1} { set r [expr {$r * $b % $m}] }
        set b [expr {$b * $b % $m}]
        set e [expr {$e >> 1}]
    }
    return $r
}

proc probably_prime {n} {
    expr {$n > 2 && [powmod 2 [expr {$n - 1}] $n] == 1}
}

foreach n {97 91 561} {
    puts "$n [expr {[probably_prime $n] ? {true} : {false}}]"
}
