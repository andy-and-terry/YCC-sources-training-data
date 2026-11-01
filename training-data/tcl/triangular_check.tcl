# n is triangular iff 8n + 1 is a perfect square.
proc isTriangular {n} {
    set s [expr {8 * $n + 1}]
    set r [expr {int(sqrt($s) + 0.5)}]
    return [expr {$r * $r == $s}]
}

set out {}
for {set n 0} {$n <= 20} {incr n} {
    if {[isTriangular $n]} { lappend out $n }
}
puts [join $out " "]
