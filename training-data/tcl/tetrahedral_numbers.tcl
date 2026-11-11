# Tetrahedral numbers n(n+1)(n+2)/6
proc term {n} {
    return [expr {(($n * ($n + 1)) * ($n + 2))/6}]
}

set out {}
for {set n 0} {$n < 10} {incr n} { lappend out [term $n] }
puts [join $out " "]
