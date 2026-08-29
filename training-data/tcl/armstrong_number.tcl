proc is_armstrong {n} {
    set digitsStr $n
    set power [string length $digitsStr]
    set total 0
    foreach c [split $digitsStr ""] {
        set total [expr {$total + pow($c, $power)}]
    }
    return [expr {int($total) == $n}]
}

puts [is_armstrong 153]
puts [is_armstrong 154]
