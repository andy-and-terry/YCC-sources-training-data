set limit 80
for {set i 2} {$i * $i <= $limit} {incr i} {
    if {![info exists composite($i)]} {
        for {set j [expr {$i * $i}]} {$j <= $limit} {incr j $i} {set composite($j) 1}
    }
}
set pairs {}
for {set p 3} {$p + 2 <= $limit} {incr p} {
    if {![info exists composite($p)] && ![info exists composite([expr {$p + 2}])]} {
        lappend pairs "($p,[expr {$p + 2}])"
    }
}
puts [join $pairs " "] ;# (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
