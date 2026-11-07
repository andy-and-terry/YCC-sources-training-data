proc plus_one {digits} {
    for {set i [expr {[llength $digits] - 1}]} {$i >= 0} {incr i -1} {
        set d [lindex $digits $i]
        if {$d < 9} {
            return [lreplace $digits $i $i [expr {$d + 1}]]
        }
        lset digits $i 0
    }
    return [linsert $digits 0 1]
}

puts [plus_one {1 2 9}] ;# 1 3 0
puts [plus_one {9 9}]   ;# 1 0 0
