# Leyland numbers: x^y + y^x for x >= y >= 2.
set vals {}
for {set x 2} {$x <= 4} {incr x} {
    for {set y 2} {$y <= $x} {incr y} {
        lappend vals [expr {int(pow($x, $y) + pow($y, $x))}]
    }
}
puts [join $vals " "]
