array set tree {}
set nextId 0

proc newNode {key} {
    global tree nextId
    set id $nextId
    incr nextId
    set tree($id,key) $key
    set tree($id,left) -1
    set tree($id,right) -1
    set tree($id,height) 1
    return $id
}

proc height {id} {
    global tree
    if {$id == -1} { return 0 }
    return $tree($id,height)
}

proc updateHeight {id} {
    global tree
    set tree($id,height) [expr {1 + max([height $tree($id,left)],[height $tree($id,right)])}]
}

proc max {a b} { return [expr {$a > $b ? $a : $b}] }

proc balanceFactor {id} {
    global tree
    return [expr {[height $tree($id,left)] - [height $tree($id,right)]}]
}

proc rotateRight {y} {
    global tree
    set x $tree($y,left)
    set t2 $tree($x,right)
    set tree($x,right) $y
    set tree($y,left) $t2
    updateHeight $y
    updateHeight $x
    return $x
}

proc rotateLeft {x} {
    global tree
    set y $tree($x,right)
    set t2 $tree($y,left)
    set tree($y,left) $x
    set tree($x,right) $t2
    updateHeight $x
    updateHeight $y
    return $y
}

proc insert {id key} {
    global tree
    if {$id == -1} {
        return [newNode $key]
    }
    if {$key < $tree($id,key)} {
        set tree($id,left) [insert $tree($id,left) $key]
    } elseif {$key > $tree($id,key)} {
        set tree($id,right) [insert $tree($id,right) $key]
    } else {
        return $id
    }
    updateHeight $id
    set balance [balanceFactor $id]
    if {$balance > 1 && $key < $tree($tree($id,left),key)} {
        return [rotateRight $id]
    }
    if {$balance < -1 && $key > $tree($tree($id,right),key)} {
        return [rotateLeft $id]
    }
    if {$balance > 1 && $key > $tree($tree($id,left),key)} {
        set tree($id,left) [rotateLeft $tree($id,left)]
        return [rotateRight $id]
    }
    if {$balance < -1 && $key < $tree($tree($id,right),key)} {
        set tree($id,right) [rotateRight $tree($id,right)]
        return [rotateLeft $id]
    }
    return $id
}

proc inorder {id} {
    global tree
    if {$id == -1} { return {} }
    return [concat [inorder $tree($id,left)] [list $tree($id,key)] [inorder $tree($id,right)]]
}

set root -1
foreach v {10 20 30 40 50 25} {
    set root [insert $root $v]
}
puts [inorder $root]
puts "height: [height $root]"
