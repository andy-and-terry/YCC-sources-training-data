namespace eval counter {
    variable n 0
    proc bump {} { variable n; incr n }
}
counter::bump; counter::bump
puts $counter::n
puts [apply {{x y} {expr {$x * $y}}} 6 7]
