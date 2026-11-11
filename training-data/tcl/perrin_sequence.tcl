# Perrin sequence P(n)=P(n-2)+P(n-3)
set v {3 0 2}
for {set i 3} {$i < 10} {incr i} {
    lappend v [expr {[lindex $v [expr {$i - 2}]] + [lindex $v [expr {$i - 3}]]}]
}
puts [join $v " "]
