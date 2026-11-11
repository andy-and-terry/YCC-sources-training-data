# Lazy caterer sequence: max pieces from n cuts
proc term {n} {
    return [expr {(($n * ($n + 1))/2) + 1}]
}

set out {}
for {set n 0} {$n < 10} {incr n} { lappend out [term $n] }
puts [join $out " "]
