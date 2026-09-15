set head ""

proc ll_push_front {value} {
    global head
    set head [dict create value $value next $head]
}

proc ll_to_list {} {
    global head
    set result {}
    set node $head
    while {$node ne ""} {
        lappend result [dict get $node value]
        set node [dict get $node next]
    }
    return $result
}

proc ll_length {} {
    return [llength [ll_to_list]]
}

foreach v {3 2 1} {
    ll_push_front $v
}

puts [ll_to_list]
puts [ll_length]
