proc is_perfect_square {n} {
    if {$n < 0} {return 0}
    set r [expr {int(sqrt($n) + 0.5)}]
    expr {$r * $r == $n}
}

set out {}
for {set n 0} {$n < 30} {incr n} {
    if {[is_perfect_square $n]} {lappend out $n}
}
puts $out
