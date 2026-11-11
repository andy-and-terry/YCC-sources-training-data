proc max_area {h} {
    set lo 0
    set hi [expr {[llength $h] - 1}]
    set best 0
    while {$lo < $hi} {
        set a [lindex $h $lo]
        set b [lindex $h $hi]
        set area [expr {min($a, $b) * ($hi - $lo)}]
        if {$area > $best} { set best $area }
        if {$a < $b} { incr lo } else { incr hi -1 }
    }
    return $best
}

puts [max_area {1 8 6 2 5 4 8 3 7}] ;# 49
