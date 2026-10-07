foreach {k v} {a 1 b 2 c 3} {
    puts "$k => $v"
}

foreach x {1 2 3} y {a b} {
    puts "x=$x y=[expr {$y eq {} ? {<none>} : $y}]"
}

foreach {name age} {Ann 30 Bob 25} idx {0 1} {
    puts "$idx: $name is $age"
}

set total 0
foreach n {1 2 3 4 5 6} {
    if {$n % 2} continue
    if {$n > 4} break
    incr total $n
}
puts "total: $total"
