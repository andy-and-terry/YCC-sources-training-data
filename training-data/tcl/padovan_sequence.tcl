# Padovan sequence: P(n) = P(n-2) + P(n-3), with P(0) = P(1) = P(2) = 1.
set p {1 1 1}
for {set n 3} {$n < 15} {incr n} {
    lappend p [expr {[lindex $p [expr {$n-2}]] + [lindex $p [expr {$n-3}]]}]
}
puts $p
