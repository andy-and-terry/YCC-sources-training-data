proc flood_fill {grid row col new} {
    set old [lindex $grid $row $col]
    if {$old == $new} { return $grid }
    set rows [llength $grid]
    set cols [llength [lindex $grid 0]]
    set stack [list [list $row $col]]

    while {[llength $stack] > 0} {
        lassign [lindex $stack end] r c
        set stack [lrange $stack 0 end-1]
        if {$r < 0 || $r >= $rows || $c < 0 || $c >= $cols} continue
        if {[lindex $grid $r $c] != $old} continue
        lset grid $r $c $new
        lappend stack [list [expr {$r + 1}] $c] [list [expr {$r - 1}] $c] \
                      [list $r [expr {$c + 1}]] [list $r [expr {$c - 1}]]
    }
    return $grid
}

set img {{1 1 0} {1 0 0} {1 1 1}}
foreach line [flood_fill $img 0 0 7] { puts $line }
