# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
proc is_bouncy {n} {
    set d [split $n ""]
    set up [lsort $d]
    set down [lreverse $up]
    return [expr {$d ne $up && $d ne $down}]
}

set count 0
for {set n 1} {$n < 1000} {incr n} {
    if {[is_bouncy $n]} { incr count }
}
puts $count
