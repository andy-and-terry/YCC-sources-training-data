proc is_prime {n} {
    if {$n < 2} {return 0}
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} {return 0}
    }
    return 1
}
set found {}
for {set p 2} {[llength $found] < 10} {incr p} {
    if {[is_prime $p] && [is_prime [expr {2 * $p + 1}]]} {lappend found $p}
}
puts [join $found " "] ;# 2 3 5 11 23 29 41 53 83 89
