proc add {a {b 10}} { expr {$a + $b} }
puts [add 1]
puts [add 1 2]
proc sum args { set t 0; foreach x $args { incr t $x }; return $t }
puts [sum 1 2 3 4]
proc incr_by {varName {n 1}} { upvar 1 $varName v; incr v $n }
set counter 5
incr_by counter
incr_by counter 10
puts $counter
proc run_in_caller {script} { uplevel 1 $script }
set x 1
run_in_caller {incr x 41}
puts $x
proc fact n { if {$n <= 1} { return 1 }; expr {$n * [fact [expr {$n - 1}]]} }
puts [fact 15]
proc named {args} { array set o {-w 1 -h 1}; array set o $args; expr {$o(-w) * $o(-h)} }
puts [named -w 3 -h 4]
set sq [list apply {{x} {expr {$x * $x}}}]
puts [{*}$sq 9]
puts [info args add]
puts [llength [split [info body fact] \n]]
puts [info commands add]
rename add plus
puts [plus 2 3]
