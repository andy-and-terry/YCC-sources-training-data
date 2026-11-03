proc count_primes_below {n} {
    if {$n < 3} {return 0}
    set count 0
    for {set i 2} {$i < $n} {incr i} {
        if {[info exists composite($i)]} continue
        incr count
        for {set j [expr {$i * $i}]} {$j < $n} {incr j $i} {
            set composite($j) 1
        }
    }
    return $count
}

puts [count_primes_below 100]
