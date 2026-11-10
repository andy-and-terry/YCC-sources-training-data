proc sigma {n} {
    set s 0
    for {set d 1} {$d <= $n} {incr d} {
        if {$n % $d == 0} {incr s $d}
    }
    return $s
}
set out {}
for {set n 1} {$n < 100} {incr n} {
    if {[sigma [sigma $n]] == 2 * $n} {lappend out $n}
}
puts [join $out " "] ;# 2 4 16 64
