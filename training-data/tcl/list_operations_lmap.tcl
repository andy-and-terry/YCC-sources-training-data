set xs {1 2 3 4 5}
puts [lmap x $xs {expr {$x * $x}}]
puts [lsearch -all -inline $xs {[2-4]}]
puts [lrange $xs 1 end-1]
