proc modes {items} {
    set top 0
    foreach x $items {
        if {![info exists counts($x)]} {set counts($x) 0}
        if {[incr counts($x)] > $top} {set top $counts($x)}
    }
    set out {}
    foreach {k c} [array get counts] {
        if {$c == $top} {lappend out $k}
    }
    return [lsort -integer $out]
}

puts [modes {1 2 2 3 3 4}]
