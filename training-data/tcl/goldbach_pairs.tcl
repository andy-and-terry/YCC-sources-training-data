proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}
set n 28
for {set p 2} {$p <= $n / 2} {incr p} {
    if {[is_prime $p] && [is_prime [expr {$n - $p}]]} {
        puts "$p + [expr {$n - $p}]"
    }
}
