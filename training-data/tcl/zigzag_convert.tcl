proc zigzag {s rows} {
    set n [string length $s]
    if {$rows == 1 || $rows >= $n} { return $s }
    for {set i 0} {$i < $rows} {incr i} { lappend lines "" }
    set r 0; set step 1
    foreach c [split $s ""] {
        lset lines $r [lindex $lines $r]$c
        if {$r == 0} { set step 1 } elseif {$r == $rows - 1} { set step -1 }
        incr r $step
    }
    join $lines ""
}

puts [zigzag PAYPALISHIRING 3]
