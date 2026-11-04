proc gcd {a b} {
    while {$b != 0} { lassign [list $b [expr {$a % $b}]] a b }
    expr {abs($a)}
}

proc gcd_all {nums} {
    set g 0
    foreach n $nums { set g [gcd $g $n] }
    return $g
}

puts [gcd_all {12 18 24}]
puts [gcd_all {7 13}]
