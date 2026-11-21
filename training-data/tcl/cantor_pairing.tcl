# Cantor pairing function and its inverse.
proc pair {x y} {
    expr {($x + $y) * ($x + $y + 1) / 2 + $y}
}

proc unpair {z} {
    set w [expr {(int(sqrt(8 * $z + 1)) - 1) / 2}]
    set y [expr {$z - $w * ($w + 1) / 2}]
    return [list [expr {$w - $y}] $y]
}

puts [pair 3 4]
puts [unpair 32]
