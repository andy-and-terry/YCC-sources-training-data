# Square of the sum minus sum of squares for 1..10 (expect 2640)
set sum 0
set squares 0
for {set i 1} {$i <= 10} {incr i} {
    incr sum $i
    incr squares [expr {$i * $i}]
}
puts [expr {$sum * $sum - $squares}]
