proc isHappy {n} {
    array set seen {}
    while {$n != 1 && ![info exists seen($n)]} {
        set seen($n) 1
        set s 0
        foreach d [split $n ""] { incr s [expr {$d * $d}] }
        set n $s
    }
    return [expr {$n == 1}]
}

set found {}
for {set n 1} {[llength $found] < 8} {incr n} {
    if {[isHappy $n]} { lappend found $n }
}
puts $found ;# 1 7 10 13 19 23 28 31
