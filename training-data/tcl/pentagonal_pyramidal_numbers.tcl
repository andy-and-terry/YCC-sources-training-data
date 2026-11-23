# n^2(n+1)/2
proc term {n} {
    return [expr {(($n * $n) * ($n + 1)) / 2}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
