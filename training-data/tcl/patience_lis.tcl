set tails {}
foreach x {10 9 2 5 3 7 101 18} {
    set i [lsearch -integer -bisect $tails $x]
    if {$i >= 0 && [lindex $tails $i] == $x} {
        # equal value already present
    } else {
        set pos [expr {$i + 1}]
        if {$pos >= [llength $tails]} { lappend tails $x } else { lset tails $pos $x }
    }
}
puts [llength $tails]
