# Bead (gravity) sort.
proc bead_sort {nums} {
    set max [tcl::mathfunc::max {*}$nums]
    set cols {}
    for {set i 1} {$i <= $max} {incr i} {
        set c 0
        foreach n $nums { if {$n >= $i} { incr c } }
        lappend cols $c
    }
    set rows {}
    for {set r 1} {$r <= [llength $nums]} {incr r} {
        set c 0
        foreach v $cols { if {$v >= $r} { incr c } }
        set rows [linsert $rows 0 $c]
    }
    return $rows
}
puts [bead_sort {5 3 1 4 2}]
