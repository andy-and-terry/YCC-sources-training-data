proc merge_lists {left right} {
    set result {}
    set i 0
    set j 0
    while {$i < [llength $left] && $j < [llength $right]} {
        if {[lindex $left $i] <= [lindex $right $j]} {
            lappend result [lindex $left $i]
            incr i
        } else {
            lappend result [lindex $right $j]
            incr j
        }
    }
    while {$i < [llength $left]} {
        lappend result [lindex $left $i]
        incr i
    }
    while {$j < [llength $right]} {
        lappend result [lindex $right $j]
        incr j
    }
    return $result
}

proc merge_sort {items} {
    if {[llength $items] <= 1} {
        return $items
    }
    set mid [expr {[llength $items] / 2}]
    set left [lrange $items 0 [expr {$mid - 1}]]
    set right [lrange $items $mid end]
    return [merge_lists [merge_sort $left] [merge_sort $right]]
}

puts [merge_sort {5 2 9 1 5 6}]
