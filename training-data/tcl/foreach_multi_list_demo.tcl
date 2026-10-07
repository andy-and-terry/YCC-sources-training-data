set names {Ada Bob Cleo}
set scores {88 72 95}

# Iterate two lists in lockstep
foreach n $names s $scores {
    puts "$n scored $s"
}

# Take several elements per iteration
foreach {x y} {1 2 3 4 5 6} {
    puts "point ($x, $y)"
}

# Uneven lists: missing values become empty strings
foreach a {1 2 3} b {x y} {
    puts "a=$a b=[expr {$b eq {} ? {<none>} : $b}]"
}

# break and continue work as usual
foreach n {1 2 3 4 5 6} {
    if {$n == 2} continue
    if {$n > 4} break
    puts $n
}
