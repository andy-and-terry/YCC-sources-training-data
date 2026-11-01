foreach {k v} {a 1 b 2 c 3} { puts "$k -> $v" }
foreach x {1 2 3} y {a b c} { puts "$x$y" }
for {set i 0} {$i < 3} {incr i} { puts -nonewline "$i " }
puts ""
