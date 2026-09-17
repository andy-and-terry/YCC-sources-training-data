array set parent {}

proc ufFind {x} {
    global parent
    if {$parent($x) == $x} {
        return $x
    }
    set parent($x) [ufFind $parent($x)]
    return $parent($x)
}

proc ufUnion {x y} {
    global parent
    set rootX [ufFind $x]
    set rootY [ufFind $y]
    if {$rootX == $rootY} {
        return 0
    }
    set parent($rootX) $rootY
    return 1
}

proc kruskalMST {n edges} {
    global parent
    for {set i 0} {$i < $n} {incr i} {
        set parent($i) $i
    }

    set sorted [lsort -integer -index 2 $edges]
    set totalWeight 0
    set mstEdges {}

    foreach edge $sorted {
        set u [lindex $edge 0]
        set v [lindex $edge 1]
        set w [lindex $edge 2]
        if {[ufUnion $u $v]} {
            lappend mstEdges $edge
            incr totalWeight $w
        }
    }
    return [list $totalWeight $mstEdges]
}

set edges {
    {0 1 4}
    {0 2 1}
    {1 2 2}
    {1 3 5}
    {2 3 8}
}

set result [kruskalMST 4 $edges]
puts "total weight: [lindex $result 0]"
puts "edges used: [lindex $result 1]"
