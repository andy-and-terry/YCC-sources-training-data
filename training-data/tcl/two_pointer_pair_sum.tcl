proc pairSum {sorted target} {
    set lo 0
    set hi [expr {[llength $sorted] - 1}]
    while {$lo < $hi} {
        set s [expr {[lindex $sorted $lo] + [lindex $sorted $hi]}]
        if {$s == $target} {
            return [list [lindex $sorted $lo] [lindex $sorted $hi]]
        } elseif {$s < $target} {
            incr lo
        } else {
            incr hi -1
        }
    }
    return {}
}

puts [pairSum {1 3 4 6 8 11} 10]
puts [pairSum {1 2 3} 100]
