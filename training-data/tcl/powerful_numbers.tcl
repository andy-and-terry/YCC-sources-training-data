proc is_powerful {n} {
    for {set p 2} {$p * $p <= $n} {incr p} {
        if {$n % $p == 0} {
            if {$n % ($p * $p) != 0} { return 0 }
            while {$n % $p == 0} { set n [expr {$n / $p}] }
        }
    }
    expr {$n == 1}
}

set out {}
for {set n 1} {$n <= 100} {incr n} {
    if {[is_powerful $n]} { lappend out $n }
}
puts $out
