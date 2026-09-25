proc quickselect {items k} {
    if {[llength $items] == 1} {
        return [lindex $items 0]
    }
    set pivot [lindex $items 0]
    set less {}
    set equal {}
    set greater {}
    foreach x $items {
        if {$x < $pivot} {
            lappend less $x
        } elseif {$x == $pivot} {
            lappend equal $x
        } else {
            lappend greater $x
        }
    }
    set lenLess [llength $less]
    set lenEqual [llength $equal]
    if {$k < $lenLess} {
        return [quickselect $less $k]
    } elseif {$k < [expr {$lenLess + $lenEqual}]} {
        return $pivot
    } else {
        return [quickselect $greater [expr {$k - $lenLess - $lenEqual}]]
    }
}

set data {7 2 9 4 1 8 3}
puts [quickselect $data 0]
puts [quickselect $data 3]
puts [quickselect $data 6]
