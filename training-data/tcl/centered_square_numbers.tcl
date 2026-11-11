# Centered square numbers 2n(n+1)+1
proc term {n} {
    return [expr {((2 * $n) * ($n + 1)) + 1}]
}

set out {}
for {set n 0} {$n < 10} {incr n} { lappend out [term $n] }
puts [join $out " "]
