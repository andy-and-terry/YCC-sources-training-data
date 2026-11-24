# Hexagonal numbers: n(2n-1).
set out {}
for {set n 1} {$n <= 10} {incr n} { lappend out [expr {$n * (2 * $n - 1)}] }
puts [join $out " "]
