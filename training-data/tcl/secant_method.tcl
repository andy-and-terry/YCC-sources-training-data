proc f {x} { expr {$x * $x - 2.0} }

proc secant {x0 x1} {
    for {set i 0} {$i < 50} {incr i} {
        set f0 [f $x0]; set f1 [f $x1]
        if {$f1 == $f0} break
        set next [expr {$x1 - $f1 * ($x1 - $x0) / ($f1 - $f0)}]
        set x0 $x1; set x1 $next
        if {abs($x1 - $x0) < 1e-12} break
    }
    return $x1
}

puts [format %.10f [secant 1.0 2.0]]
