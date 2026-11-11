# Narayana's cows N(n)=N(n-1)+N(n-3)
set v {1 1 1}
for {set i 3} {$i < 10} {incr i} {
    lappend v [expr {[lindex $v [expr {$i - 1}]] + [lindex $v [expr {$i - 3}]]}]
}
puts [join $v " "]
