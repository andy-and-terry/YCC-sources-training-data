proc binary_to_decimal {s} {
    return [expr {0b$s}]
}

puts [binary_to_decimal "1011"]
