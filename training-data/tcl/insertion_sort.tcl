proc insertion_sort {items} {
    set arr $items
    for {set i 1} {$i < [llength $arr]} {incr i} {
        set key [lindex $arr $i]
        set j [expr {$i - 1}]
        while {$j >= 0 && [lindex $arr $j] > $key} {
            set arr [lreplace $arr [expr {$j + 1}] [expr {$j + 1}] [lindex $arr $j]]
            incr j -1
        }
        set arr [lreplace $arr [expr {$j + 1}] [expr {$j + 1}] $key]
    }
    return $arr
}

puts [insertion_sort {12 11 13 5 6}]
