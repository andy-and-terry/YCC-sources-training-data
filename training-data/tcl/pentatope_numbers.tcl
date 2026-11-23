# n(n+1)(n+2)(n+3)/24
proc term {n} {
    return [expr {((($n * ($n + 1)) * ($n + 2)) * ($n + 3)) / 24}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
