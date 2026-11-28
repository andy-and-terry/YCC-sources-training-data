proc encode {text rails} {
    set rows [lrepeat $rails ""]
    set r 0; set step 1
    foreach ch [split $text ""] {
        lset rows $r [lindex $rows $r]$ch
        if {$r == 0} {set step 1} elseif {$r == $rails - 1} {set step -1}
        incr r $step
    }
    join $rows ""
}

puts [encode WEAREDISCOVERED 3]
