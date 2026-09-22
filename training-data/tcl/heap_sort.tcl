proc heapify {arrName n i} {
    upvar $arrName arr
    set largest $i
    set left [expr {2 * $i + 1}]
    set right [expr {2 * $i + 2}]

    if {$left < $n && [lindex $arr $left] > [lindex $arr $largest]} {
        set largest $left
    }
    if {$right < $n && [lindex $arr $right] > [lindex $arr $largest]} {
        set largest $right
    }
    if {$largest != $i} {
        set temp [lindex $arr $i]
        set arr [lreplace $arr $i $i [lindex $arr $largest]]
        set arr [lreplace $arr $largest $largest $temp]
        heapify arr $n $largest
    }
}

proc heap_sort {items} {
    set arr $items
    set n [llength $arr]
    for {set i [expr {$n / 2 - 1}]} {$i >= 0} {incr i -1} {
        heapify arr $n $i
    }
    for {set i [expr {$n - 1}]} {$i > 0} {incr i -1} {
        set temp [lindex $arr 0]
        set arr [lreplace $arr 0 0 [lindex $arr $i]]
        set arr [lreplace $arr $i $i $temp]
        heapify arr $i 0
    }
    return $arr
}

puts [heap_sort {5 3 8 1 9 2}]
