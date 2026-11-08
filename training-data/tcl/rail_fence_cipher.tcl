proc rail_fence {s rails} {
    set rows [lrepeat $rails ""]
    set r 0; set dir 1
    foreach ch [split $s ""] {
        lset rows $r "[lindex $rows $r]$ch"
        if {$r == 0} {set dir 1}
        if {$r == $rails - 1} {set dir -1}
        incr r $dir
    }
    join $rows ""
}
puts [rail_fence WEAREDISCOVERED 3]
