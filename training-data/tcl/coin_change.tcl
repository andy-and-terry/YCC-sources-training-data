proc min_coins {coins amount} {
    array set dp {}
    set dp(0) 0
    for {set n 1} {$n <= $amount} {incr n} {
        set dp($n) -1
        foreach c $coins {
            if {$c <= $n && $dp([expr {$n - $c}]) != -1} {
                set candidate [expr {$dp([expr {$n - $c}]) + 1}]
                if {$dp($n) == -1 || $candidate < $dp($n)} {
                    set dp($n) $candidate
                }
            }
        }
    }
    return $dp($amount)
}

puts [min_coins {1 2 5} 11]
