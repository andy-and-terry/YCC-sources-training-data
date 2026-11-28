proc encrypt {text k} {
    set cycle [expr {2 * ($k - 1)}]
    for {set r 0} {$r < $k} {incr r} { set rails($r) "" }
    for {set i 0} {$i < [string length $text]} {incr i} {
        set r [expr {$i % $cycle}]
        if {$r >= $k} { set r [expr {$cycle - $r}] }
        append rails($r) [string index $text $i]
    }
    set out ""
    for {set r 0} {$r < $k} {incr r} { append out $rails($r) }
    return $out
}
puts [encrypt WEAREDISCOVERED 3]
