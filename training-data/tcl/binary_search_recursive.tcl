proc binary_search {arr low high target} {
    if {$low > $high} {
        return -1
    }
    set mid [expr {($low + $high) / 2}]
    set midVal [lindex $arr $mid]
    if {$midVal == $target} {
        return $mid
    } elseif {$midVal < $target} {
        return [binary_search $arr [expr {$mid + 1}] $high $target]
    } else {
        return [binary_search $arr $low [expr {$mid - 1}] $target]
    }
}

set data {1 3 5 7 9 11}
puts [binary_search $data 0 5 7]
