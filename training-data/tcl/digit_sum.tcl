proc digit_sum {n} {
    set total 0
    while {$n > 0} {
        set total [expr {$total + $n % 10}]
        set n [expr {$n / 10}]
    }
    return $total
}

puts [digit_sum 12345]
