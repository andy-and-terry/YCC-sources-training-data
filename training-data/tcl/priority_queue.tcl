set heap {}

proc pq_push {value} {
    global heap
    lappend heap $value
    set i [expr {[llength $heap] - 1}]
    while {$i > 0} {
        set parent [expr {($i - 1) / 2}]
        if {[lindex $heap $parent] <= [lindex $heap $i]} break
        set tmp [lindex $heap $parent]
        lset heap $parent [lindex $heap $i]
        lset heap $i $tmp
        set i $parent
    }
}

proc pq_pop {} {
    global heap
    set top [lindex $heap 0]
    set last [expr {[llength $heap] - 1}]
    lset heap 0 [lindex $heap $last]
    set heap [lrange $heap 0 [expr {$last - 1}]]
    set i 0
    set n [llength $heap]
    while {1} {
        set left [expr {2 * $i + 1}]
        set right [expr {2 * $i + 2}]
        set smallest $i
        if {$left < $n && [lindex $heap $left] < [lindex $heap $smallest]} {
            set smallest $left
        }
        if {$right < $n && [lindex $heap $right] < [lindex $heap $smallest]} {
            set smallest $right
        }
        if {$smallest == $i} break
        set tmp [lindex $heap $smallest]
        lset heap $smallest [lindex $heap $i]
        lset heap $i $tmp
        set i $smallest
    }
    return $top
}

foreach v {5 3 8 1 9 2} {
    pq_push $v
}

for {set i 0} {$i < 6} {incr i} {
    puts [pq_pop]
}
