# n(n+1)(2n+1)/6
proc term {n} {
    return [expr {(($n * ($n + 1)) * ((2 * $n) + 1)) / 6}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
