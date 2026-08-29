proc is_power_of_two {n} {
    return [expr {$n > 0 && ($n & ($n - 1)) == 0}]
}

puts [is_power_of_two 16]
puts [is_power_of_two 18]
