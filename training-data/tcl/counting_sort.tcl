proc counting_sort {items} {
    set maxVal [lindex $items 0]
    foreach v $items {
        if {$v > $maxVal} {
            set maxVal $v
        }
    }
    for {set i 0} {$i <= $maxVal} {incr i} {
        set counts($i) 0
    }
    foreach v $items {
        incr counts($v)
    }
    set result {}
    for {set i 0} {$i <= $maxVal} {incr i} {
        for {set c 0} {$c < $counts($i)} {incr c} {
            lappend result $i
        }
    }
    return $result
}

puts [counting_sort {4 2 2 8 3 3 1}]
