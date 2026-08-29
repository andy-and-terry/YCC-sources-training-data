set stackItems {}

proc stack_push {value} {
    global stackItems
    lappend stackItems $value
}

proc stack_pop {} {
    global stackItems
    set top [lindex $stackItems end]
    set stackItems [lrange $stackItems 0 end-1]
    return $top
}

stack_push 1
stack_push 2
stack_push 3
puts [stack_pop]
puts [stack_pop]
