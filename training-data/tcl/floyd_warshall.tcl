set edges {
    {0 1 3}
    {0 2 8}
    {1 2 2}
    {2 3 1}
    {3 0 4}
}

proc floydWarshall {edges n} {
    array set dist {}
    for {set i 0} {$i < $n} {incr i} {
        for {set j 0} {$j < $n} {incr j} {
            set dist($i,$j) [expr {$i == $j ? 0 : 999999}]
        }
    }
    foreach edge $edges {
        set u [lindex $edge 0]
        set v [lindex $edge 1]
        set w [lindex $edge 2]
        set dist($u,$v) $w
    }

    for {set k 0} {$k < $n} {incr k} {
        for {set i 0} {$i < $n} {incr i} {
            for {set j 0} {$j < $n} {incr j} {
                set through [expr {$dist($i,$k) + $dist($k,$j)}]
                if {$through < $dist($i,$j)} {
                    set dist($i,$j) $through
                }
            }
        }
    }

    set rows {}
    for {set i 0} {$i < $n} {incr i} {
        set row {}
        for {set j 0} {$j < $n} {incr j} {
            lappend row $dist($i,$j)
        }
        lappend rows $row
    }
    return $rows
}

foreach row [floydWarshall $edges 4] {
    puts $row
}
