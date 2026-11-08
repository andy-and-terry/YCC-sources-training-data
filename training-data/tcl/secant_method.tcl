proc f {x} {expr {$x * $x - 2.0}}
set a 1.0; set b 2.0
for {set i 0} {$i < 40} {incr i} {
    set fa [f $a]; set fb [f $b]
    if {$fa == $fb} break
    set c [expr {$b - $fb * ($b - $a) / ($fb - $fa)}]
    set a $b; set b $c
}
puts [format %.8f $b]
