proc alternating_digit_sum {n} {
    set total 0
    set sign 1
    while {$n > 0} {
        incr total [expr {$sign * ($n % 10)}]
        set sign [expr {-$sign}]
        set n [expr {$n / 10}]
    }
    return $total
}

foreach n {1234 99999 1000} {
    puts "$n [alternating_digit_sum $n]"
}
