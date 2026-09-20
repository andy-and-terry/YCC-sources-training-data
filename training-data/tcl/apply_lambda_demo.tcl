set square {{x} {expr {$x * $x}}}
puts [apply $square 5]

proc make_adder {n} {
    return [list apply {{x n} {expr {$x + $n}}} $n]
}

proc call_adder {adderSpec x} {
    lassign $adderSpec _ lambda n
    return [apply $lambda $x $n]
}

set addFive [make_adder 5]
puts [call_adder $addFive 10]

set numbers {1 2 3 4 5}
set doubled [lmap n $numbers {apply {{x} {expr {$x * 2}}} $n}]
puts $doubled
