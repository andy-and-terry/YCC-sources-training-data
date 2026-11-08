proc delta_encode {xs} {
    set d [list [lindex $xs 0]]
    for {set i 1} {$i < [llength $xs]} {incr i} {
        lappend d [expr {[lindex $xs $i] - [lindex $xs $i-1]}]
    }
    return $d
}
proc delta_decode {ds} {
    set acc 0
    lmap d $ds {incr acc $d}
}
set d [delta_encode {10 12 15 15 20}]
puts $d
puts [delta_decode $d]
