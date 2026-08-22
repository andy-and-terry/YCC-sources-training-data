proc binarySearch {arr target} {
    set low 0
    set high [expr {[llength $arr] - 1}]
    while {$low <= $high} {
        set mid [expr {($low + $high) / 2}]
        set value [lindex $arr $mid]
        if {$value == $target} {
            return $mid
        } elseif {$value < $target} {
            set low [expr {$mid + 1}]
        } else {
            set high [expr {$mid - 1}]
        }
    }
    return -1
}

puts [binarySearch {1 3 5 7 9 11 13} 7]
puts [binarySearch {1 3 5 7 9 11 13} 4]
