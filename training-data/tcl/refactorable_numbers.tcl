proc tau {n} {
    set c 0
    for {set d 1} {$d <= $n} {incr d} {
        if {$n % $d == 0} {incr c}
    }
    return $c
}
set out {}
for {set n 1} {$n < 60} {incr n} {
    if {$n % [tau $n] == 0} {lappend out $n}
}
puts [join $out " "] ;# 1 2 8 9 12 18 24 36 40 56
