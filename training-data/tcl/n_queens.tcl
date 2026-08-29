proc is_safe {queens col} {
    set n [llength $queens]
    for {set i 0} {$i < $n} {incr i} {
        set q [lindex $queens $i]
        set dist [expr {$n - $i}]
        if {$q == $col || abs($q - $col) == $dist} {
            return 0
        }
    }
    return 1
}

proc solve {queens n} {
    if {[llength $queens] == $n} {
        return 1
    }
    set count 0
    for {set col 0} {$col < $n} {incr col} {
        if {[is_safe $queens $col]} {
            set count [expr {$count + [solve [concat $queens $col] $n]}]
        }
    }
    return $count
}

puts [solve {} 6]
