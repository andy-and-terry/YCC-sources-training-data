proc manhattan {a b} {
    set s 0
    foreach x $a y $b {
        incr s [expr {abs($x - $y)}]
    }
    return $s
}
puts [manhattan {1 2} {4 6}]
