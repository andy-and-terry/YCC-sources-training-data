proc is_sphenic {n} {
    set distinct 0
    for {set p 2} {$p * $p <= $n} {incr p} {
        if {$n % $p == 0} {
            set n [expr {$n / $p}]
            if {$n % $p == 0} { return 0 }
            incr distinct
        }
    }
    if {$n > 1} { incr distinct }
    expr {$distinct == 3}
}

set out {}
for {set n 2} {$n < 80} {incr n} {
    if {[is_sphenic $n]} { lappend out $n }
}
puts $out
