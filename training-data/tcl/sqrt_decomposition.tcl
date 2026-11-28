set a {5 3 8 1 9 2 7 4 6 0 3 5}
set bs 4
set blk {0 0 0}
for {set i 0} {$i < [llength $a]} {incr i} {
    set b [expr {$i / $bs}]
    lset blk $b [expr {[lindex $blk $b] + [lindex $a $i]}]
}
set l 2; set r 9; set s 0; set i $l
while {$i <= $r} {
    if {$i % $bs == 0 && $i + $bs - 1 <= $r} {
        incr s [lindex $blk [expr {$i / $bs}]]
        incr i $bs
    } else {
        incr s [lindex $a $i]
        incr i
    }
}
puts $s
