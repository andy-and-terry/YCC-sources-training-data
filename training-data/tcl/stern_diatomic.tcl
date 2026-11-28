set seq {0 1}
for {set i 2} {$i < 15} {incr i} {
    set h [expr {$i / 2}]
    if {$i % 2 == 0} {
        lappend seq [lindex $seq $h]
    } else {
        lappend seq [expr {[lindex $seq $h] + [lindex $seq [expr {$h + 1}]]}]
    }
}
puts $seq ;# 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
