array set segTree {}
set segTreeN 0

proc segTreeBuild {data} {
    global segTree segTreeN
    set segTreeN [llength $data]
    for {set i 0} {$i < 2 * $segTreeN} {incr i} {
        set segTree($i) 0
    }
    for {set i 0} {$i < $segTreeN} {incr i} {
        set segTree([expr {$segTreeN + $i}]) [lindex $data $i]
    }
    for {set i [expr {$segTreeN - 1}]} {$i >= 1} {incr i -1} {
        set segTree($i) [expr {$segTree([expr {2 * $i}]) + $segTree([expr {2 * $i + 1}])}]
    }
}

proc segTreeUpdate {index value} {
    global segTree segTreeN
    set i [expr {$index + $segTreeN}]
    set segTree($i) $value
    while {$i > 1} {
        set i [expr {$i / 2}]
        set segTree($i) [expr {$segTree([expr {2 * $i}]) + $segTree([expr {2 * $i + 1}])}]
    }
}

proc segTreeQuery {left right} {
    global segTree segTreeN
    set l [expr {$left + $segTreeN}]
    set r [expr {$right + $segTreeN + 1}]
    set sum 0
    while {$l < $r} {
        if {$l % 2 == 1} {
            incr sum $segTree($l)
            incr l
        }
        if {$r % 2 == 1} {
            incr r -1
            incr sum $segTree($r)
        }
        set l [expr {$l / 2}]
        set r [expr {$r / 2}]
    }
    return $sum
}

segTreeBuild {1 3 5 7 9 11}
puts [segTreeQuery 1 3]
segTreeUpdate 1 10
puts [segTreeQuery 1 3]
