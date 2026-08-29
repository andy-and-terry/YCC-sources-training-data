proc insert_node {node value} {
    if {$node eq ""} {
        return [dict create value $value left "" right ""]
    }
    set v [dict get $node value]
    if {$value < $v} {
        dict set node left [insert_node [dict get $node left] $value]
    } elseif {$value > $v} {
        dict set node right [insert_node [dict get $node right] $value]
    }
    return $node
}

proc inorder {node} {
    if {$node eq ""} {
        return {}
    }
    set result [inorder [dict get $node left]]
    lappend result [dict get $node value]
    set result [concat $result [inorder [dict get $node right]]]
    return $result
}

set root ""
foreach v {5 3 8 1 4 7 9} {
    set root [insert_node $root $v]
}
puts [inorder $root]
