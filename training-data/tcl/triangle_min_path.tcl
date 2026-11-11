proc minimum_total {triangle} {
    set dp [lindex $triangle end]
    for {set r [expr {[llength $triangle] - 2}]} {$r >= 0} {incr r -1} {
        set row [lindex $triangle $r]
        set i 0
        foreach v $row {
            lset dp $i [expr {$v + min([lindex $dp $i], [lindex $dp [expr {$i + 1}]])}]
            incr i
        }
    }
    return [lindex $dp 0]
}

puts [minimum_total {{2} {3 4} {6 5 7} {4 1 8 3}}] ;# 11
