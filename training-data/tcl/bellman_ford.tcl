set edges {
    {0 1 4}
    {0 2 5}
    {1 2 -3}
    {2 3 4}
    {3 1 -1}
}

proc bellmanFord {edges nodeCount source} {
    array set dist {}
    for {set i 0} {$i < $nodeCount} {incr i} {
        set dist($i) 999999
    }
    set dist($source) 0

    for {set iter 0} {$iter < $nodeCount - 1} {incr iter} {
        foreach edge $edges {
            set u [lindex $edge 0]
            set v [lindex $edge 1]
            set w [lindex $edge 2]
            if {$dist($u) + $w < $dist($v)} {
                set dist($v) [expr {$dist($u) + $w}]
            }
        }
    }

    foreach edge $edges {
        set u [lindex $edge 0]
        set v [lindex $edge 1]
        set w [lindex $edge 2]
        if {$dist($u) + $w < $dist($v)} {
            return "negative cycle"
        }
    }

    set result {}
    for {set i 0} {$i < $nodeCount} {incr i} {
        lappend result $dist($i)
    }
    return $result
}

puts [bellmanFord $edges 4 0]
