proc popcount {n} {
    set c 0
    while {$n != 0} {
        set n [expr {$n & ($n - 1)}]
        incr c
    }
    return $c
}
puts [popcount 0xB7]
puts [popcount 255]
