proc matrixChainOrder {dims} {
    set n [expr {[llength $dims] - 1}]
    if {$n <= 1} { return 0 }

    array set dp {}
    for {set i 0} {$i < $n} {incr i} {
        for {set j 0} {$j < $n} {incr j} {
            set dp($i,$j) 0
        }
    }

    for {set length 2} {$length <= $n} {incr length} {
        for {set i 0} {$i <= $n - $length} {incr i} {
            set j [expr {$i + $length - 1}]
            set dp($i,$j) [expr {1 << 30}]
            for {set k $i} {$k < $j} {incr k} {
                set di [lindex $dims $i]
                set dk1 [lindex $dims [expr {$k + 1}]]
                set dj1 [lindex $dims [expr {$j + 1}]]
                set cost [expr {$dp($i,$k) + $dp($k+1,$j) + $di*$dk1*$dj1}]
                if {$cost < $dp($i,$j)} {
                    set dp($i,$j) $cost
                }
            }
        }
    }
    return $dp(0,[expr {$n - 1}])
}

# Matrices: A1(40x20), A2(20x30), A3(30x10), A4(10x30)
puts [matrixChainOrder {40 20 30 10 30}]
