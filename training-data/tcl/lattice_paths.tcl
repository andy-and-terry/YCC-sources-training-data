# Lattice paths with a DP list.
proc lattice {n} {
    set row [lrepeat [expr {$n + 1}] 1]
    for {set k 0} {$k < $n} {incr k} {
        for {set j 1} {$j <= $n} {incr j} {
            lset row $j [expr {[lindex $row $j] + [lindex $row [expr {$j - 1}]]}]
        }
    }
    lindex $row $n
}
puts [lattice 3]
