# Pell numbers: P(0) = 0, P(1) = 1, P(n) = 2*P(n-1) + P(n-2).
set p {0 1}
for {set n 2} {$n < 15} {incr n} {
    lappend p [expr {2 * [lindex $p [expr {$n-1}]] + [lindex $p [expr {$n-2}]]}]
}
puts $p
