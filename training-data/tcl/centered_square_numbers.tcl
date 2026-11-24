# Centered square numbers: n^2 + (n+1)^2.
set out {}
for {set n 0} {$n < 10} {incr n} { lappend out [expr {$n * $n + ($n + 1) * ($n + 1)}] }
puts [join $out " "]
