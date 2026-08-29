proc transpose {matrix} {
    set rows [llength $matrix]
    set cols [llength [lindex $matrix 0]]
    set result {}
    for {set c 0} {$c < $cols} {incr c} {
        set row {}
        for {set r 0} {$r < $rows} {incr r} {
            lappend row [lindex [lindex $matrix $r] $c]
        }
        lappend result $row
    }
    return $result
}

puts [transpose {{1 2} {3 4}}]
