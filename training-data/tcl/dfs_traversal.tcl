set graph [dict create \
    A {B C} \
    B {D} \
    C {D} \
    D {E} \
    E {}]

proc dfs_visit {graph node visitedName} {
    upvar $visitedName visited
    if {[lsearch $visited $node] != -1} {
        return
    }
    lappend visited $node
    foreach neighbor [dict get $graph $node] {
        dfs_visit $graph $neighbor visitedName
    }
}

proc dfs {graph start} {
    set visited {}
    dfs_visit $graph $start visited
    return $visited
}

puts [dfs $graph A]
