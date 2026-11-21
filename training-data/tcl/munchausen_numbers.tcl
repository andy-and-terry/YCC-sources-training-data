# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
proc is_munchausen {n} {
    set sum 0
    foreach d [split $n ""] {
        if {$d > 0} { incr sum [expr {int(pow($d, $d))}] }
    }
    return [expr {$sum == $n}]
}

set out {}
for {set n 1} {$n < 5000} {incr n} {
    if {[is_munchausen $n]} { lappend out $n }
}
puts [join $out " "]
