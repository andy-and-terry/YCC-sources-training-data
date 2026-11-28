proc isArmstrong {n} {
    set len [string length $n]
    set sum 0
    foreach d [split $n ""] { incr sum [expr {int(pow($d, $len))}] }
    return [expr {$sum == $n}]
}

set out {}
for {set n 1} {$n < 1000} {incr n} {
    if {[isArmstrong $n]} { lappend out $n }
}
puts $out ;# 1..9 153 370 371 407
