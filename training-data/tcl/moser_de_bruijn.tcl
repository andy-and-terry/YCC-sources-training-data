# Moser-de Bruijn sequence: binary digits of n read in base 4.
proc moser {n} {
    set result 0
    set place 1
    while {$n > 0} {
        if {$n & 1} { incr result $place }
        set n [expr {$n >> 1}]
        set place [expr {$place * 4}]
    }
    return $result
}

set out {}
for {set n 0} {$n < 12} {incr n} { lappend out [moser $n] }
puts [join $out " "]
