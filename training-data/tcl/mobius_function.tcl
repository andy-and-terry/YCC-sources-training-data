# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
proc mobius {n} {
    set result 1
    for {set p 2} {$p * $p <= $n} {incr p} {
        if {$n % $p == 0} {
            set n [expr {$n / $p}]
            if {$n % $p == 0} { return 0 }
            set result [expr {-$result}]
        }
    }
    if {$n > 1} { return [expr {-$result}] }
    return $result
}

set out {}
for {set n 1} {$n <= 30} {incr n} { lappend out [mobius $n] }
puts [join $out " "]
