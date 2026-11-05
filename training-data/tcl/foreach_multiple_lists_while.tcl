foreach a {1 2 3} b {x y z} { puts "$a$b" }
set i 0
while {$i < 3} { puts "i=$i"; incr i }
for {set j 10} {$j > 0} {incr j -4} { puts "j=$j" }
