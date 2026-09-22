proc isBipartite {graph} {
    array set color {}
    foreach node [dict keys $graph] {
        set color($node) -1
    }
    foreach start [dict keys $graph] {
        if {$color($start) != -1} { continue }
        set color($start) 0
        set queue [list $start]
        while {[llength $queue] > 0} {
            set node [lindex $queue 0]
            set queue [lrange $queue 1 end]
            foreach neighbor [dict get $graph $node] {
                if {$color($neighbor) == -1} {
                    set color($neighbor) [expr {1 - $color($node)}]
                    lappend queue $neighbor
                } elseif {$color($neighbor) == $color($node)} {
                    return 0
                }
            }
        }
    }
    return 1
}

set square [dict create \
    1 {2 3} \
    2 {1 4} \
    3 {1 4} \
    4 {2 3}]
puts [isBipartite $square]

set triangle [dict create \
    1 {2 3} \
    2 {1 3} \
    3 {1 2}]
puts [isBipartite $triangle]
