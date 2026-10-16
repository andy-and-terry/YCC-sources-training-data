proc ::tcl::mathfunc::square {x} { expr {$x * $x} }
proc ::tcl::mathfunc::clamp {x lo hi} { expr {$x < $lo ? $lo : $x > $hi ? $hi : $x} }
proc ::tcl::mathfunc::hyp {a b} { expr {sqrt($a*$a + $b*$b)} }

puts [expr {square(7)}]
puts [expr {clamp(15, 0, 10)}]
puts [expr {hyp(3, 4)}]
puts [expr {square(clamp(-3, 0, 5)) + 1}]
