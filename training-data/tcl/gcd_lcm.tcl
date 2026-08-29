proc my_gcd {a b} {
    while {$b != 0} {
        set t $b
        set b [expr {$a % $b}]
        set a $t
    }
    return [expr {abs($a)}]
}

proc my_lcm {a b} {
    return [expr {abs($a * $b) / [my_gcd $a $b]}]
}

puts [my_gcd 48 18]
puts [my_lcm 4 6]
