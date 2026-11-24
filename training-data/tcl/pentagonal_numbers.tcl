# Pentagonal numbers: n(3n-1)/2.
set out {}
for {set n 1} {$n <= 10} {incr n} { lappend out [expr {$n * (3 * $n - 1) / 2}] }
puts [join $out " "]
