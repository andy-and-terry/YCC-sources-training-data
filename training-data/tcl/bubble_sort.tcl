proc bubbleSort {items} {
    set n [llength $items]
    for {set i 0} {$i < $n} {incr i} {
        for {set j 0} {$j < $n - $i - 1} {incr j} {
            set a [lindex $items $j]
            set b [lindex $items [expr {$j + 1}]]
            if {$a > $b} {
                set items [lreplace $items $j $j $b]
                set items [lreplace $items [expr {$j + 1}] [expr {$j + 1}] $a]
            }
        }
    }
    return $items
}

puts [bubbleSort {5 2 9 1 5 6}]
