proc gcd {a b} {
    while {$b != 0} {
        set temp $b
        set b [expr {$a % $b}]
        set a $temp
    }
    return $a
}

puts [gcd 48 18]
puts [gcd 100 75]
