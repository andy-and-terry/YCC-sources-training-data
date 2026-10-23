# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
set n {1 1 1}
for {set i 3} {$i < 15} {incr i} {
    lappend n [expr {[lindex $n [expr {$i - 1}]] + [lindex $n [expr {$i - 3}]]}]
}
puts $n
