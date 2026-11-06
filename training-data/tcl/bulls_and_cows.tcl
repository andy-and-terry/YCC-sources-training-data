# Bulls and Cows scoring for equal-length digit strings.
proc score {secret guess} {
    set bulls 0
    array set sc {}
    array set gc {}
    for {set i 0} {$i < [string length $secret]} {incr i} {
        set s [string index $secret $i]
        set g [string index $guess $i]
        if {$s eq $g} {
            incr bulls
        } else {
            if {![info exists sc($s)]} { set sc($s) 0 }
            if {![info exists gc($g)]} { set gc($g) 0 }
            incr sc($s)
            incr gc($g)
        }
    }
    set cows 0
    foreach c [array names sc] {
        if {[info exists gc($c)]} { incr cows [expr {min($sc($c), $gc($c))}] }
    }
    return [list $bulls $cows]
}

lassign [score 1807 7810] b c
puts "$b bull(s), $c cow(s)"
