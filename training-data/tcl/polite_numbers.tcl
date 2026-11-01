# Ways to write n as a sum of two or more consecutive positive integers.
proc politeWays {n} {
    set ways 0
    for {set k 2} {$k * ($k + 1) / 2 <= $n} {incr k} {
        if {($n - $k * ($k - 1) / 2) % $k == 0} { incr ways }
    }
    return $ways
}

set out {}
for {set n 1} {$n <= 16} {incr n} { lappend out [politeWays $n] }
puts [join $out " "]
