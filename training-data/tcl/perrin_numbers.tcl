# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
set p {3 0 2}
for {set n 3} {$n < 15} {incr n} {
    lappend p [expr {[lindex $p [expr {$n - 2}]] + [lindex $p [expr {$n - 3}]]}]
}
puts $p
