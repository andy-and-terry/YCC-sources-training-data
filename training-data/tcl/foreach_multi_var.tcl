foreach {name age} {Ann 31 Bob 17 Cy 45} {
    puts "$name is $age"
}

foreach a {1 2 3} b {x y z} {
    puts "$a$b"
}

foreach x {1 2 3} y {a b} {
    puts "x=$x y=[expr {$y eq "" ? "(none)" : $y}]"
}

set total 0
foreach n {5 10 15 20} {
    if {$n == 10} continue
    if {$n > 15} break
    incr total $n
}
puts "total=$total"

for {set i 0} {$i < 3} {incr i} {
    puts "i=$i"
}
set i 3
while {$i > 0} {
    puts -nonewline "$i "
    incr i -1
}
puts ""
