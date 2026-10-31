set fact {1 1 2 6 24 120 720 5040 40320 362880}

proc is_factorion {n} {
    global fact
    set sum 0
    foreach d [split $n ""] {
        incr sum [lindex $fact $d]
    }
    expr {$sum == $n}
}

set found {}
for {set n 1} {$n < 50000} {incr n} {
    if {[is_factorion $n]} { lappend found $n }
}
puts $found
