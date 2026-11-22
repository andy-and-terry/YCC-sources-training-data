# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
set row {1}
set out {1}
for {set i 0} {$i < 9} {incr i} {
    set next {0}
    foreach x [lreverse $row] {
        lappend next [expr {[lindex $next end] + $x}]
    }
    set row $next
    lappend out [lindex $row end]
}
puts [join $out " "]
