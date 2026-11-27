proc is_prime {n} {
    if {$n < 2} {return 0}
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} {return 0}
    }
    return 1
}

set out {}
for {set y 1} {[llength $out] < 8} {incr y} {
    set p [expr {3 * $y * $y + 3 * $y + 1}]
    if {[is_prime $p]} {lappend out $p}
}
puts $out
