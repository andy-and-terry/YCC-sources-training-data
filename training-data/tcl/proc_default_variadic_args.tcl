proc greet {name {greeting "Hello"}} {
    return "$greeting, $name!"
}

puts [greet "Ada"]
puts [greet "Bob" "Welcome"]

proc sum_all {args} {
    set total 0
    foreach n $args {
        incr total $n
    }
    return $total
}

puts [sum_all 1 2 3]
puts [sum_all 10 20 30 40]

proc average {first args} {
    set values [linsert $args 0 $first]
    set total 0
    foreach v $values {
        incr total $v
    }
    return [expr {double($total) / [llength $values]}]
}

puts [average 4 8 12]
