# Sum of prime factors counted with multiplicity.
proc sopfr {n} {
    set total 0
    for {set p 2} {$p * $p <= $n} {incr p} {
        while {$n % $p == 0} {
            incr total $p
            set n [expr {$n / $p}]
        }
    }
    if {$n > 1} { incr total $n }
    return $total
}

set out {}
for {set n 2} {$n < 110} {incr n} {
    if {[sopfr $n] == [sopfr [expr {$n + 1}]]} { lappend out $n }
}
puts [join $out " "]
