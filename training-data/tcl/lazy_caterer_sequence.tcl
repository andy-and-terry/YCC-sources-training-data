# n(n+1)/2+1
proc term {n} {
    return [expr {(($n * ($n + 1)) / 2) + 1}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
