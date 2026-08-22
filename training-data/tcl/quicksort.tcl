proc quicksort {items} {
    if {[llength $items] <= 1} {
        return $items
    }
    set pivot [lindex $items [expr {[llength $items] / 2}]]
    set left {}
    set mid {}
    set right {}
    foreach x $items {
        if {$x < $pivot} {
            lappend left $x
        } elseif {$x == $pivot} {
            lappend mid $x
        } else {
            lappend right $x
        }
    }
    return [concat [quicksort $left] $mid [quicksort $right]]
}

puts [quicksort {5 3 8 1 9 2}]
