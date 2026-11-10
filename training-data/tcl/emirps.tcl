proc is_prime {n} {
    if {$n < 2} {return 0}
    for {set i 2} {$i * $i <= $n} {incr i} {
        if {$n % $i == 0} {return 0}
    }
    return 1
}
set out {}
for {set n 2} {[llength $out] < 10} {incr n} {
    set r [string reverse $n]
    scan $r %d r
    if {$r != $n && [is_prime $n] && [is_prime $r]} {lappend out $n}
}
puts [join $out " "] ;# 13 17 31 37 71 73 79 97 107 113
