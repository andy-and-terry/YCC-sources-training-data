# Positive n expressible as a*a + b*b with a, b >= 0.
proc representable {n} {
    for {set a 0} {$a * $a <= $n} {incr a} {
        for {set b $a} {$a * $a + $b * $b <= $n} {incr b} {
            if {$a * $a + $b * $b == $n} { return 1 }
        }
    }
    return 0
}

set out {}
for {set n 1} {$n <= 30} {incr n} {
    if {[representable $n]} { lappend out $n }
}
puts [join $out " "]
