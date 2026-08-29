array set graph {a "b c" b "d" c "d" d ""}
set visited {}
set order {}

proc visit_node {node} {
    global graph visited order
    if {[lsearch $visited $node] != -1} {
        return
    }
    lappend visited $node
    foreach dep $graph($node) {
        visit_node $dep
    }
    lappend order $node
}

foreach node [array names graph] {
    visit_node $node
}
puts $order
