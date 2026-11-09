set i 0
while {$i < 3} { puts "i=$i"; incr i }
foreach {k v} {a 1 b 2} { puts "$k->$v" }
for {set j 0} {$j < 3} {incr j} { puts $j }
