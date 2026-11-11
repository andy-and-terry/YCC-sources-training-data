# Count contiguous subarrays whose sum equals k (prefix sums + dict).
proc count_subarrays {nums k} {
    set seen [dict create 0 1]
    set total 0
    set count 0
    foreach x $nums {
        incr total $x
        set need [expr {$total - $k}]
        if {[dict exists $seen $need]} { incr count [dict get $seen $need] }
        dict incr seen $total
    }
    return $count
}

puts [count_subarrays {1 1 1} 2]
