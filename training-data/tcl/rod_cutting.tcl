proc rodCutting {prices length} {
    array set dp {}
    set dp(0) 0

    for {set n 1} {$n <= $length} {incr n} {
        set best -999999
        for {set cut 1} {$cut <= $n} {incr cut} {
            set price [lindex $prices [expr {$cut - 1}]]
            set candidate [expr {$price + $dp([expr {$n - $cut}])}]
            if {$candidate > $best} {
                set best $candidate
            }
        }
        set dp($n) $best
    }
    return $dp($length)
}

puts [rodCutting {1 5 8 9 10 17 17 20} 8]
