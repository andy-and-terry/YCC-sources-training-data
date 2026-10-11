set zeros [lrepeat 5 0]
puts $zeros

set grid [lrepeat 2 [lrepeat 3 .]]
puts $grid

set seq {a b c d e}
puts [lreverse $seq]
puts [lreverse {}]
