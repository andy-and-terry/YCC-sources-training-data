# Disarium numbers: digits raised to their 1-based positions sum to n.
proc is_disarium {n} {
    set sum 0
    set i 0
    foreach d [split $n ""] {
        incr i
        incr sum [expr {int(pow($d, $i))}]
    }
    return [expr {$sum == $n}]
}

set out {}
for {set n 1} {$n < 1000} {incr n} {
    if {[is_disarium $n]} { lappend out $n }
}
puts [join $out " "]
