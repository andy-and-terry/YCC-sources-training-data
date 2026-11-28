proc gcd {a b} {
    while {$b != 0} { lassign [list $b [expr {$a % $b}]] a b }
    return $a
}

proc rho {n} {
    if {$n % 2 == 0} { return 2 }
    set x 2; set y 2; set d 1
    while {$d == 1} {
        set x [expr {($x * $x + 1) % $n}]
        set y [expr {($y * $y + 1) % $n}]
        set y [expr {($y * $y + 1) % $n}]
        set d [gcd [expr {abs($x - $y)}] $n]
    }
    return $d
}

set n 8051
set p [rho $n]
puts "$n = $p * [expr {$n / $p}]"
