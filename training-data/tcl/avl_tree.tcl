proc node_height {node} {
    if {$node eq ""} {
        return 0
    }
    return [dict get $node height]
}

proc update_height {node} {
    set left [dict get $node left]
    set right [dict get $node right]
    set h [expr {1 + max([node_height $left], [node_height $right])}]
    dict set node height $h
    return $node
}

proc balance_factor {node} {
    if {$node eq ""} {
        return 0
    }
    return [expr {[node_height [dict get $node left]] - [node_height [dict get $node right]]}]
}

proc rotate_right {node} {
    set left [dict get $node left]
    set left_right [dict get $left right]
    dict set node left $left_right
    set node [update_height $node]
    dict set left right $node
    set left [update_height $left]
    return $left
}

proc rotate_left {node} {
    set right [dict get $node right]
    set right_left [dict get $right left]
    dict set node right $right_left
    set node [update_height $node]
    dict set right left $node
    set right [update_height $right]
    return $right
}

proc avl_insert {node value} {
    if {$node eq ""} {
        return [dict create value $value left "" right "" height 1]
    }
    set v [dict get $node value]
    if {$value < $v} {
        dict set node left [avl_insert [dict get $node left] $value]
    } elseif {$value > $v} {
        dict set node right [avl_insert [dict get $node right] $value]
    } else {
        return $node
    }
    set node [update_height $node]
    set bf [balance_factor $node]

    if {$bf > 1 && $value < [dict get [dict get $node left] value]} {
        return [rotate_right $node]
    }
    if {$bf < -1 && $value > [dict get [dict get $node right] value]} {
        return [rotate_left $node]
    }
    if {$bf > 1 && $value > [dict get [dict get $node left] value]} {
        dict set node left [rotate_left [dict get $node left]]
        return [rotate_right $node]
    }
    if {$bf < -1 && $value < [dict get [dict get $node right] value]} {
        dict set node right [rotate_right [dict get $node right]]
        return [rotate_left $node]
    }
    return $node
}

proc inorder {node} {
    if {$node eq ""} {
        return {}
    }
    set result [inorder [dict get $node left]]
    lappend result [dict get $node value]
    return [concat $result [inorder [dict get $node right]]]
}

set root ""
foreach v {10 20 30 40 50 25} {
    set root [avl_insert $root $v]
}
puts [inorder $root]
puts "root value: [dict get $root value]"
puts "root height: [dict get $root height]"
