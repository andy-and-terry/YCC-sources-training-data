# n(n+1)(n+2)/6
proc term {n} {
    return [expr {(($n * ($n + 1)) * ($n + 2)) / 6}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
