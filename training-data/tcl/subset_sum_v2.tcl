proc subset_sum {values target} {
    set n [llength $values]
    for {set i 0} {$i <= $n} {incr i} {
        for {set s 0} {$s <= $target} {incr s} {
            set dp($i,$s) 0
        }
    }
    for {set i 0} {$i <= $n} {incr i} {
        set dp($i,0) 1
    }
    for {set i 1} {$i <= $n} {incr i} {
        set v [lindex $values [expr {$i - 1}]]
        for {set s 1} {$s <= $target} {incr s} {
            set dp($i,$s) $dp([expr {$i - 1}],$s)
            if {$v <= $s && $dp([expr {$i - 1}],[expr {$s - $v}])} {
                set dp($i,$s) 1
            }
        }
    }
    return $dp($n,$target)
}

puts [subset_sum {3 34 4 12 5 2} 9]
puts [subset_sum {3 34 4 12 5 2} 10]
puts [subset_sum {1 2 3} 7]
