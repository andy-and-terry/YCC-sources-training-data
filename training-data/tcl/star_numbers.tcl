# 6n(n-1)+1
proc term {n} {
    return [expr {((6 * $n) * ($n - 1)) + 1}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
