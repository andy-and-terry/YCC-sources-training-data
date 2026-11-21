# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
proc gcd {a b} {
    while {$b != 0} { lassign [list $b [expr {$a % $b}]] a b }
    return $a
}

proc phi {n} {
    set c 0
    for {set k 1} {$k <= $n} {incr k} {
        if {[gcd $k $n] == 1} { incr c }
    }
    return $c
}

proc chain_sum {m} {
    set total 0
    while {$m > 1} {
        set m [phi $m]
        incr total $m
    }
    return $total
}

set out {}
for {set n 2} {$n < 200} {incr n} {
    if {[chain_sum $n] == $n} { lappend out $n }
}
puts [join $out " "]
