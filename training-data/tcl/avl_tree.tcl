package require Tcl 8.6

array set node_value {}
array set node_left {}
array set node_right {}
array set node_height {}
set next_id 0

proc node_height_of {id} {
    global node_height
    if {$id eq ""} {
        return 0
    }
    return $node_height($id)
}

proc balance_factor {id} {
    global node_left node_right
    if {$id eq ""} {
        return 0
    }
    return [expr {[node_height_of $node_left($id)] - [node_height_of $node_right($id)]}]
}

proc update_height {id} {
    global node_left node_right node_height
    set leftHeight [node_height_of $node_left($id)]
    set rightHeight [node_height_of $node_right($id)]
    set node_height($id) [expr {1 + [max $leftHeight $rightHeight]}]
}

proc max {a b} {
    return [expr {$a > $b ? $a : $b}]
}

proc new_node {value} {
    global node_value node_left node_right node_height next_id
    set id "n[incr next_id]"
    set node_value($id) $value
    set node_left($id) ""
    set node_right($id) ""
    set node_height($id) 1
    return $id
}

proc rotate_right {y} {
    global node_left node_right
    set x $node_left($y)
    set t2 $node_right($x)
    set node_right($x) $y
    set node_left($y) $t2
    update_height $y
    update_height $x
    return $x
}

proc rotate_left {x} {
    global node_left node_right
    set y $node_right($x)
    set t2 $node_left($y)
    set node_left($y) $x
    set node_right($x) $t2
    update_height $x
    update_height $y
    return $y
}

proc avl_insert {id value} {
    global node_value node_left node_right
    if {$id eq ""} {
        return [new_node $value]
    }
    if {$value < $node_value($id)} {
        set node_left($id) [avl_insert $node_left($id) $value]
    } elseif {$value > $node_value($id)} {
        set node_right($id) [avl_insert $node_right($id) $value]
    } else {
        return $id
    }

    update_height $id
    set balance [balance_factor $id]

    if {$balance > 1 && $value < $node_value($node_left($id))} {
        return [rotate_right $id]
    }
    if {$balance < -1 && $value > $node_value($node_right($id))} {
        return [rotate_left $id]
    }
    if {$balance > 1 && $value > $node_value($node_left($id))} {
        set node_left($id) [rotate_left $node_left($id)]
        return [rotate_right $id]
    }
    if {$balance < -1 && $value < $node_value($node_right($id))} {
        set node_right($id) [rotate_right $node_right($id)]
        return [rotate_left $id]
    }
    return $id
}

proc avl_inorder {id} {
    global node_value node_left node_right
    if {$id eq ""} {
        return {}
    }
    return [concat [avl_inorder $node_left($id)] [list $node_value($id)] [avl_inorder $node_right($id)]]
}

set root ""
foreach value {10 20 30 40 50 25} {
    set root [avl_insert $root $value]
}
puts [avl_inorder $root]
puts [node_height_of $root]
