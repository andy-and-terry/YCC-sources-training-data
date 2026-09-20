proc counting_sort {items} {
    if {[llength $items] == 0} {
        return {}
    }
    set maxValue [lindex [lsort -integer $items] end]
    set counts [lrepeat [expr {$maxValue + 1}] 0]
    foreach value $items {
        lset counts $value [expr {[lindex $counts $value] + 1}]
    }
    set result {}
    for {set value 0} {$value <= $maxValue} {incr value} {
        set count [lindex $counts $value]
        for {set i 0} {$i < $count} {incr i} {
            lappend result $value
        }
    }
    return $result
}

puts [counting_sort {4 2 2 8 3 3 1}]
puts [counting_sort {}]
