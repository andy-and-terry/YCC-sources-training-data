set inStack {}
set outStack {}

proc q2_enqueue {value} {
    global inStack
    lappend inStack $value
}

proc q2_dequeue {} {
    global inStack outStack
    if {[llength $outStack] == 0} {
        while {[llength $inStack] > 0} {
            set top [lindex $inStack end]
            set inStack [lrange $inStack 0 end-1]
            lappend outStack $top
        }
    }
    set front [lindex $outStack end]
    set outStack [lrange $outStack 0 end-1]
    return $front
}

q2_enqueue 1
q2_enqueue 2
q2_enqueue 3
puts [q2_dequeue]
puts [q2_dequeue]
q2_enqueue 4
puts [q2_dequeue]
puts [q2_dequeue]
