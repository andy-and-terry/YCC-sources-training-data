proc extended_gcd {a b} {
    if {$b == 0} {
        return [list $a 1 0]
    }
    lassign [extended_gcd $b [expr {$a % $b}]] g x1 y1
    set x $y1
    set y [expr {$x1 - ($a / $b) * $y1}]
    return [list $g $x $y]
}

lassign [extended_gcd 30 20] g x y
puts "gcd=$g x=$x y=$y"

lassign [extended_gcd 35 15] g2 x2 y2
puts "gcd=$g2 x=$x2 y=$y2"
puts "check: [expr {35 * $x2 + 15 * $y2}]"
