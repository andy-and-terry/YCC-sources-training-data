proc new_circular_buffer {capacity} {
    return [dict create data {} capacity $capacity size 0 start 0]
}

proc push_buffer {buf value} {
    set capacity [dict get $buf capacity]
    set size [dict get $buf size]
    set start [dict get $buf start]
    set index [expr {($start + $size) % $capacity}]
    set data [dict get $buf data]
    dict set data $index $value
    dict set buf data $data
    if {$size < $capacity} {
        dict set buf size [expr {$size + 1}]
    } else {
        dict set buf start [expr {($start + 1) % $capacity}]
    }
    return $buf
}

set buf [new_circular_buffer 3]
foreach v {1 2 3 4 5} {
    set buf [push_buffer $buf $v]
}
puts [dict get $buf data]
