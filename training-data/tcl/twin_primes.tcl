proc is_prime {n} {
    if {$n < 2} { return 0 }
    for {set d 2} {$d * $d <= $n} {incr d} {
        if {$n % $d == 0} { return 0 }
    }
    return 1
}
for {set p 3} {$p + 2 <= 50} {incr p} {
    if {[is_prime $p] && [is_prime [expr {$p + 2}]]} {
        puts "($p, [expr {$p + 2}])"
    }
}
