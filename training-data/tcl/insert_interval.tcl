proc insert_interval {intervals new} {
    lassign $new lo hi
    set out {}
    set placed 0
    foreach iv $intervals {
        lassign $iv l h
        if {$h < $lo} {
            lappend out $iv
        } elseif {$l > $hi} {
            if {!$placed} { lappend out [list $lo $hi]; set placed 1 }
            lappend out $iv
        } else {
            set lo [expr {min($lo, $l)}]
            set hi [expr {max($hi, $h)}]
        }
    }
    if {!$placed} { lappend out [list $lo $hi] }
    return $out
}

puts [insert_interval {{1 3} {6 9}} {2 5}] ;# {1 5} {6 9}
