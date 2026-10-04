foreach {key value} {one 1 two 2 three 3} {
    puts "$key => $value"
}

foreach a {1 2 3} b {x y} {
    puts "a=$a b=[expr {$b eq "" ? "(none)" : $b}]"
}

foreach {x y z} {1 2 3 4 5} {
    puts "x=$x y=$y z=[expr {$z eq "" ? "-" : $z}]"
}

set total 0
foreach n {1 2 3 4 5 6 7 8 9 10} {
    if {$n % 2} continue
    if {$n > 8} break
    incr total $n
}
puts "sum of evens up to 8: $total"

for {set i 0} {$i < 3} {incr i} {
    puts -nonewline "$i "
}
puts ""
