# Highest value reached by the Collatz (hailstone) sequence from n.
proc peak {n} {
    set best $n
    while {$n != 1} {
        if {$n % 2 == 0} { set n [expr {$n / 2}] } else { set n [expr {3 * $n + 1}] }
        if {$n > $best} { set best $n }
    }
    return $best
}

puts [peak 27]
