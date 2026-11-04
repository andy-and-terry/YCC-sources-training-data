proc is_toeplitz {m} {
    for {set i 1} {$i < [llength $m]} {incr i} {
        set prev [lindex $m [expr {$i - 1}]]
        set cur [lindex $m $i]
        for {set j 1} {$j < [llength $cur]} {incr j} {
            if {[lindex $cur $j] != [lindex $prev [expr {$j - 1}]]} { return 0 }
        }
    }
    return 1
}

puts [is_toeplitz {{1 2 3} {4 1 2} {5 4 1}}]
puts [is_toeplitz {{1 2} {2 2}}]
