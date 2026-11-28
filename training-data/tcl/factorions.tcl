set fact {1 1 2 6 24 120 720 5040 40320 362880}
set out {}
for {set n 1} {$n < 50000} {incr n} {
    set s 0
    foreach d [split $n ""] { incr s [lindex $fact $d] }
    if {$s == $n} { lappend out $n }
}
puts $out ;# 1 2 145 40585
