proc my_power {base exp} {
    if {$exp == 0} {
        return 1
    }
    if {$exp % 2 == 0} {
        set half [my_power $base [expr {$exp / 2}]]
        return [expr {$half * $half}]
    }
    return [expr {$base * [my_power $base [expr {$exp - 1}]]}]
}

puts [my_power 2 10]
puts [my_power 3 5]
