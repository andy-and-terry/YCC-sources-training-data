proc selection_sort {items} {
    set arr $items
    set n [llength $arr]
    for {set i 0} {$i < $n - 1} {incr i} {
        set minIdx $i
        for {set j [expr {$i + 1}]} {$j < $n} {incr j} {
            if {[lindex $arr $j] < [lindex $arr $minIdx]} {
                set minIdx $j
            }
        }
        set temp [lindex $arr $i]
        set arr [lreplace $arr $i $i [lindex $arr $minIdx]]
        set arr [lreplace $arr $minIdx $minIdx $temp]
    }
    return $arr
}

puts [selection_sort {5 3 8 1 9 2}]
