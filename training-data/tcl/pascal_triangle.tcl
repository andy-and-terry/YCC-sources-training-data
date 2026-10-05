proc pascal_row {n} {
    set row {1}
    for {set i 1} {$i <= $n} {incr i} {
        set next {1}
        for {set j 1} {$j < $i} {incr j} {
            lappend next [expr {[lindex $row [expr {$j - 1}]] + [lindex $row $j]}]
        }
        lappend next 1
        set row $next
    }
    return $row
}

for {set r 0} {$r < 6} {incr r} {
    puts [join [pascal_row $r] " "]
}
