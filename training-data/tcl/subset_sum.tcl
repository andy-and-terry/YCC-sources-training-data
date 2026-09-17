proc hasSubsetSum {nums target} {
    array set dp {}
    for {set t 0} {$t <= $target} {incr t} {
        set dp($t) 0
    }
    set dp(0) 1

    foreach num $nums {
        for {set t $target} {$t >= $num} {incr t -1} {
            if {$dp([expr {$t - $num}])} {
                set dp($t) 1
            }
        }
    }
    return $dp($target)
}

puts [hasSubsetSum {3 34 4 12 5 2} 9]
puts [hasSubsetSum {1 2 5} 4]
