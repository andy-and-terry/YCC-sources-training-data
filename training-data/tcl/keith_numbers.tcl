# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
proc is_keith {n} {
    set seq [split $n ""]
    set k [llength $seq]
    while {[lindex $seq end] < $n} {
        set sum 0
        foreach v [lrange $seq end-[expr {$k - 1}] end] { incr sum $v }
        lappend seq $sum
    }
    return [expr {[lindex $seq end] == $n}]
}

set out {}
for {set n 10} {$n < 1200} {incr n} {
    if {[is_keith $n]} { lappend out $n }
}
puts [join $out " "]
