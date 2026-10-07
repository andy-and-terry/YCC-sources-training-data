proc add {a b} { expr {$a + $b} }

interp alias {} plus {} add
puts [plus 2 3]

# Alias with prefilled argument (partial application)
interp alias {} add10 {} add 10
puts [add10 5]

# Slave interpreter with an alias back into the master
set slave [interp create]
$slave alias hostAdd add
puts [$slave eval {hostAdd 4 5}]

$slave eval {set x 100}
puts [$slave eval {expr {$x + 1}}]
puts [info exists x]
interp delete $slave
