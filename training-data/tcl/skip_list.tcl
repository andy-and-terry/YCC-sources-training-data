array set nodes {}
set nextId 0
set maxLevel 4

proc newNode {value level} {
    global nodes nextId
    set id $nextId
    incr nextId
    set nodes($id,value) $value
    for {set i 0} {$i <= $level} {incr i} {
        set nodes($id,fwd,$i) -1
    }
    set nodes($id,level) $level
    return $id
}

set headId [newNode -2147483648 4]
set listLevel 0

proc randomLevel {} {
    global maxLevel
    set lvl 0
    while {rand() < 0.5 && $lvl < $maxLevel} { incr lvl }
    return $lvl
}

proc slInsert {value} {
    global nodes headId listLevel maxLevel
    set update {}
    for {set i 0} {$i <= $maxLevel} {incr i} { lappend update -1 }
    set cur $headId

    for {set i $listLevel} {$i >= 0} {incr i -1} {
        while {$nodes($cur,fwd,$i) != -1 && $nodes($nodes($cur,fwd,$i),value) < $value} {
            set cur $nodes($cur,fwd,$i)
        }
        lset update $i $cur
    }

    set newLevel [randomLevel]
    if {$newLevel > $listLevel} {
        for {set i [expr {$listLevel + 1}]} {$i <= $newLevel} {incr i} {
            lset update $i $headId
        }
        set listLevel $newLevel
    }

    set id [newNode $value $newLevel]
    for {set i 0} {$i <= $newLevel} {incr i} {
        set predecessor [lindex $update $i]
        set nodes($id,fwd,$i) $nodes($predecessor,fwd,$i)
        set nodes($predecessor,fwd,$i) $id
    }
}

proc slContains {value} {
    global nodes headId listLevel
    set cur $headId
    for {set i $listLevel} {$i >= 0} {incr i -1} {
        while {$nodes($cur,fwd,$i) != -1 && $nodes($nodes($cur,fwd,$i),value) < $value} {
            set cur $nodes($cur,fwd,$i)
        }
    }
    set candidate $nodes($cur,fwd,0)
    return [expr {$candidate != -1 && $nodes($candidate,value) == $value}]
}

foreach v {3 6 7 9 12 19 17} { slInsert $v }
puts [slContains 19]
puts [slContains 15]
