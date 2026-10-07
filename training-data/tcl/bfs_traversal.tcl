set graph [dict create \
    1 {2 3} \
    2 {1 4} \
    3 {1 4} \
    4 {2 3 5} \
    5 {4}]

proc bfs {graph start} {
    set visited [list $start]
    set queue [list $start]
    set order {}
    while {[llength $queue] > 0} {
        set node [lindex $queue 0]
        set queue [lrange $queue 1 end]
        lappend order $node
        foreach neighbor [dict get $graph $node] {
            if {$neighbor ni $visited} {
                lappend visited $neighbor
                lappend queue $neighbor
            }
        }
    }
    return $order
}

puts [bfs $graph 1]
puts [bfs $graph 5]
