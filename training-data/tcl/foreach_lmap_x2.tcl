set squares [lmap x {1 2 3 4} { expr {$x * $x} }]
puts $squares
