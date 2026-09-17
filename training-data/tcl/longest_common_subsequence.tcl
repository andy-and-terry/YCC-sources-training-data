proc lcs {a b} {
    set m [string length $a]
    set n [string length $b]
    array set dp {}
    for {set i 0} {$i <= $m} {incr i} {
        for {set j 0} {$j <= $n} {incr j} {
            set dp($i,$j) 0
        }
    }

    for {set i 1} {$i <= $m} {incr i} {
        for {set j 1} {$j <= $n} {incr j} {
            if {[string index $a [expr {$i - 1}]] eq [string index $b [expr {$j - 1}]]} {
                set dp($i,$j) [expr {$dp([expr {$i - 1}],[expr {$j - 1}]) + 1}]
            } else {
                set left $dp($i,[expr {$j - 1}])
                set up $dp([expr {$i - 1}],$j)
                set dp($i,$j) [expr {$left > $up ? $left : $up}]
            }
        }
    }
    return $dp($m,$n)
}

puts [lcs "ABCBDAB" "BDCABA"]
