proc prime_factor_count {n} {
    set count 0
    for {set p 2} {$p * $p <= $n} {incr p} {
        while {$n % $p == 0} {
            set n [expr {$n / $p}]
            incr count
        }
    }
    if {$n > 1} { incr count }
    return $count
}

set out {}
for {set n 2} {$n < 30} {incr n} {
    if {[prime_factor_count $n] == 2} { lappend out $n }
}
puts $out
