proc digit_square_sum {n} {
    set sum 0
    foreach d [split [expr {abs($n)}] ""] {
        incr sum [expr {$d * $d}]
    }
    return $sum
}

puts [digit_square_sum 123]
puts [digit_square_sum -99]
