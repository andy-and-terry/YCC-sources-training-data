# n(2n^2+1)/3
proc term {n} {
    return [expr {($n * (((2 * $n) * $n) + 1)) / 3}]
}

for {set n 1} {$n <= 15} {incr n} {
    puts [format "%2d -> %d" $n [term $n]]
}
