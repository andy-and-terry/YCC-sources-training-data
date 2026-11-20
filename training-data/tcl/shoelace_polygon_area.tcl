# Shoelace polygon area.
set pts {{0 0} {4 0} {4 3} {0 3}}
set s 0
set n [llength $pts]
for {set i 0} {$i < $n} {incr i} {
    lassign [lindex $pts $i] x1 y1
    lassign [lindex $pts [expr {($i + 1) % $n}]] x2 y2
    incr s [expr {$x1 * $y2 - $x2 * $y1}]
}
puts [expr {abs($s) / 2.0}]
