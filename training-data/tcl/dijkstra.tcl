array set graph {}
set graph(a) {{b 1} {c 4}}
set graph(b) {{c 2} {d 5}}
set graph(c) {{d 1}}
set graph(d) {}

proc dijkstra {source} {
    global graph
    array set dist {}
    foreach node [array names graph] {
        set dist($node) 999999
    }
    set dist($source) 0
    set visited {}

    for {set iter 0} {$iter < [array size graph]} {incr iter} {
        set bestNode ""
        set bestDist 999999
        foreach node [array names dist] {
            if {[lsearch $visited $node] == -1 && $dist($node) < $bestDist} {
                set bestNode $node
                set bestDist $dist($node)
            }
        }
        if {$bestNode eq ""} {
            break
        }
        lappend visited $bestNode
        foreach edge $graph($bestNode) {
            set neighbor [lindex $edge 0]
            set weight [lindex $edge 1]
            set newDist [expr {$bestDist + $weight}]
            if {$newDist < $dist($neighbor)} {
                set dist($neighbor) $newDist
            }
        }
    }
    return [array get dist]
}

puts [dijkstra "a"]
