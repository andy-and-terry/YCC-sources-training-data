proc transpose {m} {
    set rows [llength $m]
    set cols [llength [lindex $m 0]]
    set out {}
    for {set c 0} {$c < $cols} {incr c} {
        set newRow {}
        for {set r 0} {$r < $rows} {incr r} {
            lappend newRow [lindex $m $r $c]
        }
        lappend out $newRow
    }
    return $out
}

set m {{1 2 3} {4 5 6}}
foreach row [transpose $m] { puts $row }
