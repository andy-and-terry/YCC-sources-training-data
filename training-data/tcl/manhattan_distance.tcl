# Manhattan distance with lmap.
proc manhattan {a b} {
    tcl::mathop::+ {*}[lmap x $a y $b { expr {abs($x - $y)} }]
}
puts [manhattan {1 2} {4 6}]
