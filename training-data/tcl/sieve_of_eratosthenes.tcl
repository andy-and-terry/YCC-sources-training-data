proc sieve {limit} {
    array set isComposite {}
    for {set i 2} {$i * $i <= $limit} {incr i} {
        if {![info exists isComposite($i)]} {
            for {set j [expr {$i * $i}]} {$j <= $limit} {incr j $i} {
                set isComposite($j) 1
            }
        }
    }
    set result {}
    for {set n 2} {$n <= $limit} {incr n} {
        if {![info exists isComposite($n)]} {
            lappend result $n
        }
    }
    return $result
}

puts [sieve 50]
