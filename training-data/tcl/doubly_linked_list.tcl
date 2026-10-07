array set nodes {}
set nextId 0
set headId -1
set tailId -1

proc newNode {value} {
    global nodes nextId
    set id $nextId
    incr nextId
    set nodes($id,value) $value
    set nodes($id,prev) -1
    set nodes($id,next) -1
    return $id
}

proc pushBack {value} {
    global nodes headId tailId
    set id [newNode $value]
    if {$tailId == -1} {
        set headId $id
        set tailId $id
    } else {
        set nodes($tailId,next) $id
        set nodes($id,prev) $tailId
        set tailId $id
    }
}

proc removeNode {id} {
    global nodes headId tailId
    set prevId $nodes($id,prev)
    set nextId2 $nodes($id,next)
    if {$prevId != -1} { set nodes($prevId,next) $nextId2 } else { set headId $nextId2 }
    if {$nextId2 != -1} { set nodes($nextId2,prev) $prevId } else { set tailId $prevId }
}

proc toList {} {
    global nodes headId
    set result {}
    set cur $headId
    while {$cur != -1} {
        lappend result $nodes($cur,value)
        set cur $nodes($cur,next)
    }
    return $result
}

pushBack 10
pushBack 20
pushBack 30
pushBack 40
puts [toList]
removeNode 1
puts [toList]
