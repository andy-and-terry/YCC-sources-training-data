set i 0
while {1} {
    incr i
    if {$i % 2 == 0} continue
    if {$i > 9} break
    puts "odd: $i"
}

for {set a 0; set b 10} {$a < $b} {incr a; incr b -1} {
    puts "a=$a b=$b"
}

set n 27
set steps 0
while {$n != 1} {
    set n [expr {$n % 2 ? 3*$n+1 : $n/2}]
    incr steps
}
puts "collatz steps: $steps"
