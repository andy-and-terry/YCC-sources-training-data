array set graph {}
set graph(a) {{b 2} {c 3}}
set graph(b) {{a 2} {c 1} {d 4}}
set graph(c) {{a 3} {b 1} {d 5}}
set graph(d) {{b 4} {c 5}}

proc primMST {start} {
    global graph
    array set inMST {}
    array set key {}
    foreach node [array names graph] {
        set inMST($node) 0
        set key($node) 999999
    }
    set key($start) 0

    set totalWeight 0
    set nodeCount [array size graph]

    for {set i 0} {$i < $nodeCount} {incr i} {
        set u ""
        set best 999999
        foreach node [array names graph] {
            if {!$inMST($node) && $key($node) < $best} {
                set u $node
                set best $key($node)
            }
        }
        if {$u eq ""} {
            break
        }
        set inMST($u) 1
        incr totalWeight $key($u)
        foreach edge $graph($u) {
            set v [lindex $edge 0]
            set w [lindex $edge 1]
            if {!$inMST($v) && $w < $key($v)} {
                set key($v) $w
            }
        }
    }
    return $totalWeight
}

puts "MST total weight: [primMST a]"
