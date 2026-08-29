set queueItems {}

proc queue_enqueue {value} {
    global queueItems
    lappend queueItems $value
}

proc queue_dequeue {} {
    global queueItems
    set front [lindex $queueItems 0]
    set queueItems [lrange $queueItems 1 end]
    return $front
}

queue_enqueue 1
queue_enqueue 2
queue_enqueue 3
puts [queue_dequeue]
puts [queue_dequeue]
